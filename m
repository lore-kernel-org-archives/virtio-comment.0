Return-Path: <virtio-comment-return-9025-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA25C47DDB
	for <virtio-comment@archiver.kernel.org>; Mon, 29 Jan 2024 16:51:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9BC8A2AF9D
	for <virtio-comment@archiver.kernel.org>; Mon, 29 Jan 2024 16:51:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 761C298687D
	for <virtio-comment@archiver.kernel.org>; Mon, 29 Jan 2024 16:51:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5C957983F75; Mon, 29 Jan 2024 16:51:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4BEB8986871
	for <virtio-comment@lists.oasis-open.org>; Mon, 29 Jan 2024 16:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: GjyMVD-jMNKk4f8Ski_nvw-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, Peter Hilber
 <peter.hilber@opensynergy.com>, "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>
In-Reply-To: <PH0PR12MB548136F408DA5F0CA8B2B0E8DC7F2@PH0PR12MB5481.namprd12.prod.outlook.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20231218064253.9734-4-peter.hilber@opensynergy.com>
 <DM8PR12MB5480022FDB88FBCEAA13E2C9DC772@DM8PR12MB5480.namprd12.prod.outlook.com>
 <aca3c781-3932-4cc1-aef4-f29fb1297b4a@opensynergy.com>
 <PH0PR12MB548136F408DA5F0CA8B2B0E8DC7F2@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 29 Jan 2024 17:51:49 +0100
Message-ID: <874jewkrq2.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] RE: [RFC PATCH v3 3/4] virtio-rtc: Add alarm feature

On Sun, Jan 28 2024, Parav Pandit <parav@nvidia.com> wrote:

>> From: Peter Hilber <peter.hilber@opensynergy.com>
>> Sent: Wednesday, January 24, 2024 9:11 PM
>> 
>> On 20.01.24 11:16, Parav Pandit wrote:
>> >
>> >
>> >> From: Peter Hilber <peter.hilber@opensynergy.com>
>> >> Sent: Monday, December 18, 2023 12:13 PM
>> >> @@ -13,13 +14,23 @@ \subsection{Virtqueues}\label{sec:Device Types /
>> >> RTC Device / Virtqueues}
>> >>
>> >>  \begin{description}
>> >>  \item[0] requestq
>> >> +\item[1] alarmq
>> >>  \end{description}
>> >>
>> >>  The driver enqueues requests to the requestq.
>> >>
>> >> +Through the alarmq, the device notifies the driver about alarm
>> >> +expirations. The alarmq exists only if VIRTIO_RTC_F_ALARM was
>> >> +negotiated.
>> >> +
>> > I think is a good example of a need of notification queue from device to
>> driver that has multiple use as generic object.
>> > On NIC side also we have been thinking to have VQ that holds only the
>> completions as currently packed and splitvq unaligned and shorter
>> completions are performance reducing areas.
>> >
>> > A queue which has 1 to 8 physical addresses, and which can hold 8 to 64B
>> of notification will be useful.
>> > This way per descriptor posting and DMA is not needed.
>> > These notifications also work very fast with least amount of descriptor
>> caching on the device.
>> >
>> > For alarms this may not be concern at all in current form but overall, such a
>> generic infra has multiple uses.
>> > So, I suggest we bring the notification queue.
>> 
>> IIUC this notification queue still needs to be described.
>>
> Yes. 
> What we need is something like,
>
> A notification queue is a queue that holds device to driver notifications.
> The device writes the notification entry, the driver consumes it.
> Each notification entry consists of N bytes written by the device. Typically N bytes range from 8 to 64B.
> Posting every descriptor of 16B for such small size entry is very inefficient; hence a notification queue is simpler enough that does not have one to one mapping of notification entry and descriptor.
> A Notification descriptor points to a page memory. Each page holds one or more notification entries.
> Number of notification entries in a descriptor = page_size / notification entry size;
> For example, a notification queue consists of 2 4K pages, with 16B notification entry, can receive 512 notifications, with only two descriptors posting, offering 256X reduction in descriptors management at just 0.39% descriptor table size than current packed vq format.

This looks not entirely unlike ccw two-stage-indicators (which is in
turn preceded by other uses of adapter interrupts with indicators,
e.g. in QDIO). Can we learn from those earlier implementations?

However, while this looks like an interesting addition, I'm not sure we
should make rtc wait for all of that (including your other suggestions)
to be ready and approved -- a simpler rtc implementation has its
advantages as well (like already being there, for example.) We can
easily add things via feature bits later.


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

