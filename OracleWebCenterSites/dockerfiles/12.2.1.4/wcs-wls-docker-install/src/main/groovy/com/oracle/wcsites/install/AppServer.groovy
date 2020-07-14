/**
 * Copyright (c) 2019, 2020 Oracle and/or its affiliates.
 * Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
 */
package com.oracle.wcsites.install

interface AppServer {

	/**
	 * Extracts binaries, copies relevant files/directories
	 */
	def unPack()
	
	/**
	 * Creates database schema
	 */
	def createSchema()

	/**
	 * Kicks off silent install and restarts server
	 */
	def install()
}
