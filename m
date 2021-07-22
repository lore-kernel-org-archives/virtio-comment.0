Return-Path: <virtio-comment-return-2044-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E647A98635A
	for <virtio-comment@lists.oasis-open.org>; Thu, 22 Jul 2021 11:41:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <CALzYo309tuJLLhVGdGc6RxOgQr5Y_ZtEsS=xG9Uu8G5_b42S7Q@mail.gmail.com>
References: <20210721205939.20746-1-tstark@linux.microsoft.com>
 <87mtqe7g7z.fsf@redhat.com>
 <CALzYo309tuJLLhVGdGc6RxOgQr5Y_ZtEsS=xG9Uu8G5_b42S7Q@mail.gmail.com>
Date: Thu, 22 Jul 2021 13:41:21 +0200
Message-ID: <87h7gm7ezi.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH 0/1] virtio-pmem: Support PCI
 BAR-relative addresses
Content-Type: text/plain
To: Pankaj Gupta <pankaj.gupta@ionos.com>
Cc: Taylor Stark <tstark@linux.microsoft.com>, virtio-comment@lists.oasis-open.org, grahamwo@microsoft.com, benhill@microsoft.com, "Michael S . Tsirkin" <mst@redhat.com>, Taylor Stark <tstark@microsoft.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jul 22 2021, Pankaj Gupta <pankaj.gupta@ionos.com> wrote:

> Hi Cornelia,
>
>> > This patch updates the virtio-pmem spec to add support for describing the pmem
>> > region via PCI BARs. This is required to support virtio-pmem in Hyper-V, since
>> > Hyper-V only allows PCI devices to operate on memory ranges defined via BARs.
>> >
>> > As virtio-pmem hasn't been added to the virtio spec yet (see this issue [1]),
>> > this patch is based off the RFC spec [2]. The linux driver implementation has
>> > been posted at [3].
>>
>> What's the general status of the pmem spec? I had pinged in the issue,
>> but I have not seen any progress.
>
> Appologies for missing your ping (As I was down for some time). I will
> try to post the
> virtio-pmem spec new version in coming week.

Thanks, that's good news!


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

