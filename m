Return-Path: <virtio-comment-return-2377-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E7738986456
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Nov 2021 16:50:50 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <YZ0Z/ks4ZoHHZRJK@stefanha-x1.localdomain>
References: <20211110185555.190-1-tstark@linux.microsoft.com>
 <20211110185555.190-2-tstark@linux.microsoft.com>
 <87sfw37ymd.fsf@redhat.com> <YZ0Z/ks4ZoHHZRJK@stefanha-x1.localdomain>
Date: Tue, 23 Nov 2021 17:49:58 +0100
Message-ID: <87tug2kea1.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v5 1/1] virtio-pmem: Support describing
 pmem as shared memory region
Content-Type: text/plain
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: tstark@linux.microsoft.com, virtio-comment@lists.oasis-open.org, grahamwo@microsoft.com, benhill@microsoft.com, tstark@microsoft.com, pankaj.gupta.linux@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Nov 23 2021, Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, Nov 11, 2021 at 11:52:42AM +0100, Cornelia Huck wrote:
>> On Wed, Nov 10 2021, tstark@linux.microsoft.com wrote:
>> 
>> > From: Taylor Stark <tstark@microsoft.com>
>> >
>> > Update the virtio-pmem spec to add support for describing the pmem region as a
>> > shared memory window. This is required to support virtio-pmem in Hyper-V, since
>> > Hyper-V only allows PCI devices to operate on memory ranges defined via BARs.
>> > When using the virtio PCI transport, shared memory regions are described via
>> > PCI BARs.
>> >
>> > Signed-off-by: Taylor Stark <tstark@microsoft.com>
>> > ---
>> >  conformance.tex | 14 ++++++++++++--
>> >  virtio-pmem.tex | 40 +++++++++++++++++++++++++++++++++-------
>> >  2 files changed, 45 insertions(+), 9 deletions(-)
>> 
>> This looks good to me now.
>
> I noticed the patch uses "guest absolute address" instead of "physical
> address". This terminology was fixed in the original pmem patch and I
> guess the shared memory patch wasn't updated. Please don't use "guest".

So s/guest absolute/physical/ ? That can be fixed as an editorial update
on top.


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

