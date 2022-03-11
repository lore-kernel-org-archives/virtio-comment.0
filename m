Return-Path: <virtio-comment-return-2813-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8BB81986683
	for <virtio-comment@lists.oasis-open.org>; Fri, 11 Mar 2022 16:35:05 +0000 (UTC)
Message-ID: <486f583a-2957-0414-5336-545bcf9b0189@opensynergy.com>
Date: Fri, 11 Mar 2022 17:34:53 +0100
References: <70626dae-9d81-5fd2-5b08-8a377042c339@opensynergy.com>
 <DM6PR11MB384948F551208BB1187D7569850C9@DM6PR11MB3849.namprd11.prod.outlook.com>
From: Harald Mommer <hmo@opensynergy.com>
In-Reply-To: <DM6PR11MB384948F551208BB1187D7569850C9@DM6PR11MB3849.namprd11.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Comments on RPMB config space chapter 5.2.14
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: "Huang, Yang" <yang.huang@intel.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Lukasz Zawada <Lukasz.Zawada@opensynergy.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 11.03.22 17:02, Huang, Yang wrote:
>   
>> 1.) We have an underlying physical RPMB device we would like to forward to
>> a virtual machine via virtio RPMB. Looks like the physical device has a
>> capacity of 256. 256 > 0x80. And 256 also does not fit in the u8 capacity of the
> 256*128KB = 32MB RPMB. What's your flash, eMMC, UFS or NVMe?

UFS. I should still try to find out what exact chip is used on the board 
and try to confirm with the data sheet (if available) that the capacity 
of 256 we got from ioctl RPMB_IOC_CAP_CMD is indeed the correct one. 
Which means 32MB. just to rule out I'm not fooled by some obscure bug 
somewhere in the stack.

>> structure. Thinking now of cutting to 0x80 to fulfill the exact wording of the
>> specification. Alternatively we might violate the specification and cut to 255
>> which is the biggest value still fitting in u8 capacity. But nothing of this is
>> satisfying.
>>
>> 2.) Looking at the specification the maximum RPMB block count is 256. In our

I'm referring to the virtio specification as it is currently on latest 
master in https://github.com/oasis-tcs/virtio-spec.git.

2.) is not about the total size of the RPMB device but about the max. 
allowed number of blocks to be read or written at a time in one chunk 
(config space max_wr_cnt and max_rd_cnt). While in the text 256B is 
still a valid value in the config space this value would not fit into 
the u8. Not the issue now but remarkable when we are already in clause 
5.12.4.



This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

