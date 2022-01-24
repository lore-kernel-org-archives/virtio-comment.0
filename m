Return-Path: <virtio-comment-return-2620-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6BC0E98642F
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Jan 2022 13:14:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <Ye6ksdW5FQtmbhjB@stefanha-x1.localdomain>
References: <cover.1639494803.git.qemu_oss@crudebyte.com>
 <4971f1bee76d664a71d411d8769a23a0d04097e7.1639494803.git.qemu_oss@crudebyte.com>
 <Ye6ksdW5FQtmbhjB@stefanha-x1.localdomain>
Date: Mon, 24 Jan 2022 14:14:07 +0100
Message-ID: <877dapl1i8.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH 1/2] Add VIRTIO_RING_F_INDIRECT_SIZE
Content-Type: text/plain
To: Stefan Hajnoczi <stefanha@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jan 24 2022, Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Tue, Dec 14, 2021 at 04:13:10PM +0100, Christian Schoenebeck wrote:
>> This new feature flag allows to decouple the maximum amount of
>> descriptors in indirect descriptor tables from the Queue Size.
>> 
>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> ---
>>  content.tex    | 21 +++++++++++++++++++++
>>  split-ring.tex |  2 +-
>>  2 files changed, 22 insertions(+), 1 deletion(-)
>> 
>> diff --git a/content.tex b/content.tex
>> index 5d112af..0aa4842 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -6693,6 +6693,27 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>    transport specific.
>>    For more details about driver notifications over PCI see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Available Buffer Notifications}.
>>  
>> +  \item[VIRTIO_RING_F_INDIRECT_SIZE(40)] This feature indicates that the
>
> Another feature bit was added in the meantime:
>
>   \item[VIRTIO_F_RING_RESET(40)] This feature indicates
>                             ^^
>
> Please use 41 and update the text that says:
>
>   \item[24 to 40] Feature bits reserved for extensions to the queue and
>   feature negotiation mechanisms
>
>   \item[41 to 49, and 128 and above] Feature bits reserved for future extensions.

Indeed... I'm wondering whether we could automate updating this with
some clever variables?


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

