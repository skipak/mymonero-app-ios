//
//  Dispatch.ios.hpp
//  Copyright (c) 2014-2019, MyMonero.com
//
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are
//  permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this list of
//	conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice, this list
//	of conditions and the following disclaimer in the documentation and/or other
//	materials provided with the distribution.
//
//  3. Neither the name of the copyright holder nor the names of its contributors may be
//	used to endorse or promote products derived from this software without specific
//	prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
//  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
//  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
//  THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
//  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
//  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
//  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
//  THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#ifndef Dispatch_ios_hpp
#define Dispatch_ios_hpp

#include <string>
#import <Foundation/Foundation.h>
#include "./Dispatch_Interface.hpp"

namespace Dispatch
{
	using namespace std;
	//
	struct CancelableTimerHandle_ios: public CancelableTimerHandle
	{
		NSTimer *_t;
		//
		BOOL isCanceled; 
		//
		CancelableTimerHandle_ios(NSTimer *t): _t(t)
		{
		}
		~CancelableTimerHandle_ios(); // implemented in .cpp file
		//
		void cancel();
	};
	//
	struct Dispatch_ios: public Dispatch
	{
		Dispatch_ios()
		{
		}
		~Dispatch_ios() {}
		//
		std::unique_ptr<CancelableTimerHandle> after(uint32_t ms, std::function<void()>&& fn);
		void async(std::function<void()>&& fn);
	private:
	};
}

#endif /* Dispatch_ios_hpp */
