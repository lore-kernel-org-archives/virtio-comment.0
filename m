Return-Path: <virtio-comment-return-2049-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 63DCB98636D
	for <virtio-comment@lists.oasis-open.org>; Fri, 23 Jul 2021 07:00:07 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20210722232626.GA32055@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20210721205939.20746-1-tstark@linux.microsoft.com>
 <20210721205939.20746-2-tstark@linux.microsoft.com>
 <87k0li7fry.fsf@redhat.com>
 <20210722232626.GA32055@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Date: Fri, 23 Jul 2021 08:59:51 +0200
Message-ID: <875yx17bx4.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH 1/1] virtio-pmem: Support PCI
 BAR-relative addresses
Content-Type: text/plain
To: Taylor Stark <tstark@linux.microsoft.com>
Cc: virtio-comment@lists.oasis-open.org, grahamwo@microsoft.com, benhill@microsoft.com, mst@redhat.com, pankaj.gupta@ionos.com, Taylor Stark <tstark@microsoft.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jul 22 2021, Taylor Stark <tstark@linux.microsoft.com> wrote:

> On Thu, Jul 22, 2021 at 01:24:17PM +0200, Cornelia Huck wrote:
>> On Wed, Jul 21 2021, tstark@linux.microsoft.com wrote:
>> 
>> > From: Taylor Stark <tstark@microsoft.com>
>> >
>> > Update the virtio-pmem RFC spec to add support for describing the pmem region
>> > via PCI BARs. Shared memory windows are used to accomplish this, similar to
>> > virtio-fs and virtio-gpu. This is required to support virtio-pmem in Hyper-V,
>> > since Hyper-V only allows PCI devices to operate on memory ranges defined via
>> > BARs.
>> 
>> Given that we already have pmem support out there (even though the spec
>> has not been included yet, should this get a feature?
>
> I wasn't sure if we needed to handle backwards compatibility given that pmem
> hasn't been merged into the spec yet. If we do, then yes I think it makes sense
> to add a feature bit. How about VIRTIO_PMEM_F_SHMEM_REGION?

Sounds good to me.

>> Also, requirements belong in a normative section; it's better to just
>> describe textually what the driver needs to do here and split out the
>> normative statements.
>
> Will do (ditto for your other comments). Thanks for the suggestions. It's
> a learning process for me - had to go and lookup what normative meant.. :)

If you have any further questions (or any suggestions how we can make
this easier for newcomers), feel free to follow up :)


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

