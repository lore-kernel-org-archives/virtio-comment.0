Return-Path: virtio-comment-return-1360-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8BC59985DDF
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Jul 2020 07:02:13 +0000 (UTC)
References: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
 <20200715132748.GA20677@stefanha-x1.localdomain>
 <88a33034-783a-07d2-85e0-c1a1ecd2721f@siemens.com>
 <20200723065423.GE268427@stefanha-x1.localdomain>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <10df6427-eab0-d3b8-4624-ede98ff7ef09@siemens.com>
Date: Thu, 23 Jul 2020 09:02:09 +0200
MIME-Version: 1.0
In-Reply-To: <20200723065423.GE268427@stefanha-x1.localdomain>
Content-Language: en-US
Subject: Re: [virtio-comment] [RFC] ivshmem v2: Shared memory device
 specification
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jailhouse <jailhouse-dev@googlegroups.com>, qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, liang yan <lyan@suse.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 23.07.20 08:54, Stefan Hajnoczi wrote:
> On Fri, Jul 17, 2020 at 06:15:58PM +0200, Jan Kiszka wrote:
>> On 15.07.20 15:27, Stefan Hajnoczi wrote:
>>> On Mon, May 25, 2020 at 09:58:28AM +0200, Jan Kiszka wrote:
> 
> Thanks for the responses. It would be great to update the spec with
> these clarifications.
> 
>>>> If BAR 2 is not present, the shared memory region is not relocatable
>>>> by the user. In that case, the hypervisor has to implement the Base
>>>> Address register in the vendor-specific capability.
>>>
>>> What does relocatable mean in this context?
>>
>> That the guest can decide (via BAR) where the resource should show up in the
>> physical guest address space. We do not want to support this in setups like
>> for static partitioning hypervisors, and then we use that side-channel
>> read-only configuration.
> 
> I see. I'm not sure what is vendor-specific about non-relocatable shared
> memory. I guess it could be added to the spec too?

That "vendor-specific" comes from the PCI spec which - to my 
understanding - provides us no other means to introduce registers to the 
config space that are outside of the PCI spec. I could introduce a name 
for the ivshmem vendor cap and use that name here - would that be better?

> 
> In any case, since "relocatable" hasn't been fully defined, I suggest
> making the statement more general:
> 
>    If BAR 2 is not present the hypervisor has to implement the Base
>    Address Register in the vendor-specific capability. This can be used
>    for vendor-specific shared memory functionality.
> 

Will integrate this.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

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

