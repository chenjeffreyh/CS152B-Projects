#include <stdint.h>
#include <stdlib.h>

#include "globals.h"

#ifndef MAZE_SYSTEM_H
#define MAZE_SYSTEM_H

/**
 * Enumeration of the possible maze directions.
 */
typedef enum {
	/*
	 * Moving upwards.
	 */
	UP,

	/*
	 * Moving straight.
	 */
	STRAIGHT,

	/*
	 * Moving downwards.
	 */
	DOWN
} MAZE_DIR;

/**
 * A full description of the maze in a single column.
 */
typedef struct col_def {
	/*
	 * The upper bound y-coordinate (actually a lower number).
	 */
	int16_t upper_bound;

	/*
	 * The lower bound y-coordinate.
	 */
	int16_t lower_bound;

	/*
	 * The current direction of the maze.
	 */
	MAZE_DIR maze_direction;
} COL_DEF;

/**
 * Generates an appropriate new maze column given a maze column.
 *
 * @param cur_col The existing column to anchor the new column off of.
 * @param size_change The change in maze width from cur_col to the column
 *        being generated.
 *
 * @return A new column definition.
 */
COL_DEF generate_col_def(COL_DEF cur_col, int16_t size_change) {
	MAZE_DIR new_dir;
	int16_t new_upper;
	int16_t new_lower;

	uint16_t rand_seed = rand() % 100;

	switch(cur_col.maze_direction) {
	case UP:
		switch(rand_seed) {
		case 0:
			new_dir = STRAIGHT;
			break;
		case 1:
			new_dir = DOWN;
			break;
		default:
			new_dir = UP;
			break;
		}
		break;

	case STRAIGHT:
		switch (rand_seed) {
		case 0:
			new_dir = DOWN;
			break;
		case 1:
			new_dir = UP;
			break;
		default:
			new_dir = STRAIGHT;
			break;
		}
		break;

	case DOWN:
		switch (rand_seed) {
		case 0:
			new_dir = STRAIGHT;
			break;
		case 1:
			new_dir = UP;
			break;
		default:
			new_dir = DOWN;
			break;
		}
		break;

	default:
		new_dir = cur_col.maze_direction;
	}

	switch (new_dir) {
	case UP:
		new_upper = cur_col.upper_bound - 1;
		new_lower = cur_col.lower_bound - 1 + size_change;
		break;
	case STRAIGHT:
		new_upper = cur_col.upper_bound;
		new_lower = cur_col.lower_bound + size_change;
		break;
	case DOWN:
		new_upper = cur_col.upper_bound + 1;
		new_lower = cur_col.lower_bound + 1 + size_change;
		break;
	default:
		new_upper = cur_col.upper_bound;
		new_lower = cur_col.lower_bound + size_change;
	}

	/*
	 * Cap the bounds if they are about to run off the screen.
	 */
	if (new_upper < 0 ||
		new_lower >= GRAPHIC_HEIGHT) {
		new_upper = cur_col.upper_bound;
		new_lower = cur_col.lower_bound;
	}

	/*
	 * Create the new column definition.
	 */
	COL_DEF new_col_def = {.maze_direction = new_dir,
			               .upper_bound = new_upper,
			               .lower_bound = new_lower};

	return new_col_def;
}

#endif
