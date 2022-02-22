Return-Path: <virtio-comment-return-2766-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 58D709863B5
	for <virtio-comment@lists.oasis-open.org>; Tue, 22 Feb 2022 09:20:27 +0000 (UTC)
References: <1645101080313.3853@amazon.com>
 <20220217125506.icgvndy3v66cyhxy@sgarzare-redhat>
 <0420e5d6-60f0-be57-ec6a-e88127174cda@gmail.com>
 <1645519589258.8467@amazon.com>
From: Arseniy Krasnov <oxffffaa@gmail.com>
Message-ID: <7ce12c17-a25e-379d-23df-38015dc2d86e@gmail.com>
Date: Tue, 22 Feb 2022 12:20:20 +0300
MIME-Version: 1.0
In-Reply-To: <1645519589258.8467@amazon.com>
Subject: Re: [virtio-comment] vsock: define a maximum size for the packet data
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: "Loghin, Laura" <lauralg@amazon.com>, Stefano Garzarella <sgarzare@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>


On 22.02.2022 11:46, Loghin, Laura wrote:
> Hello,
>
> I was thinking that this limit would be used on the TX path (because on the RX, the device is considered to be trusted it will add a shorter buffer). The size of the TX buffer would still be the one from the header or from its descriptor (this is another thing that I think should be explicitly mentioned in the spec even though it's pretty obvious; there is no mention at this moment about what `len` is). The driver would be "forced" by that limit to not send bigger buffers, but we can have like a double-check in the device code that this is indeed happening.
I see, this will be new check in 'virtio_transport_alloc_pkt()' when it calls kmalloc() for packet buffer?
>
> Laura
>
> ________________________________________
> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-open.org> on behalf of Arseniy Krasnov <oxffffaa@gmail.com>
> Sent: Tuesday, February 22, 2022 10:18 AM
> To: Stefano Garzarella; Loghin, Laura
> Cc: virtio-comment@lists.oasis-open.org
> Subject: RE: [EXTERNAL] [virtio-comment] vsock: define a maximum size for the packet data
>
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>
>
>
> Hello
>
> On 17.02.2022 15:55, Stefano Garzarella wrote:
>> On Thu, Feb 17, 2022 at 12:31:20PM +0000, Loghin, Laura wrote:
>>> Hello,
>>>
>>> Would it be possible to define a maximum size for the packet data in the spec (for example the one from the Linux driver [1])? We are working on a vsock packet implementation in rust-vmm [2], and we would like to check for some sort of limit for the data packet,
>>>
>>> without using the limit from a specific driver implementation. We want to do this so that the driver is not allowed to reserve huge chunks of memory. VMMs might want to reject packets that have bigger data arrays.  This limit could probably be defined in the VMM as well, and then propagated/checked where it is needed, but it would be nicer to have one at the spec level.
>>>
>> Yep, I think it is possible, but maybe to limit the memory used in the guest, it would be better to add a field in the configuration space to define the maximum packet size (like MTU for virtio-net) for each device.
>>
> So, rely on current implementation, virtio vsock rx buffers will be allocated with this size from config? And also both peers must negotiate this value(like credit size), to avoid packets drop?
>
>
> Thank You
>
>> At that point we can also add a maximum that seems reasonable. For now I think the theoretical maximum is 4GB since the len field is on 32bit, obviously not a real limit :-)
>>
>> Thanks,
>> Stefano
>>
>>
>> This publicly archived list offers a means to provide input to the
>> OASIS Virtual I/O Device (VIRTIO) TC.
>>
>> In order to verify user consent to the Feedback License terms and
>> to minimize spam in the list archive, subscription is required
>> before posting.
>>
>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>> List help: virtio-comment-help@lists.oasis-open.org
>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>> Committee: https://www.oasis-open.org/committees/virtio/
>> Join OASIS: https://www.oasis-open.org/join/
>>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>
>
>
>
> Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in Romania. Registration number J22/2621/2005.
>

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

