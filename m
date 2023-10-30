Return-Path: <virtio-comment-return-8032-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A612C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 08:41:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A6ED22357E
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 08:41:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8C109986B22
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 08:41:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 763AC986B1B; Mon, 30 Oct 2023 08:41:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 65F32986B1C
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 08:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 68ml7AjMMVqyw-fe-8L__Q-1
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
In-Reply-To: <20231029102837-mutt-send-email-mst@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231029140437.1379386-1-parav@nvidia.com>
 <20231029102837-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 30 Oct 2023 09:41:38 +0100
Message-ID: <87zg00qz7h.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [PATCH] packed-ring: Change host,guest to device,driver

On Sun, Oct 29 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Sun, Oct 29, 2023 at 04:04:37PM +0200, Parav Pandit wrote:
>> Rest of the packed ring description already uses the device
>> and driver terminology. Change the introductory line as well from
>> host and guest to device and driver respectively.
>> 
>> Signed-off-by: Parav Pandit <parav@nvidia.com>
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
> Editorial change, right Cornelia?

Agreed.

>
>> ---
>>  packed-ring.tex | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/packed-ring.tex b/packed-ring.tex
>> index 9eeb382..2bb66de 100644
>> --- a/packed-ring.tex
>> +++ b/packed-ring.tex
>> @@ -2,7 +2,7 @@ \section{Packed Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Pack
>>  
>>  Packed virtqueues is an alternative compact virtqueue layout using
>>  read-write memory, that is memory that is both read and written
>> -by both host and guest.
>> +by both the device and the driver.
>>  
>>  Use of packed virtqueues is negotiated by the VIRTIO_F_RING_PACKED
>>  feature bit.
>> -- 
>> 2.34.1


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

