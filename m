Return-Path: <virtio-comment-return-8937-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B15CC3DA79
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 15:54:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 606D460346
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 15:54:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2DBE2986556
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 15:54:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 14BAA9863E6; Mon, 15 Jan 2024 15:54:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0389B98640B
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 Jan 2024 15:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 6jiMOOAHM5mvvFzk0K1jQQ-1
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Hilber <peter.hilber@opensynergy.com>,
 virtio-comment@lists.oasis-open.org
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>
In-Reply-To: <a284ed4f-9ca1-4b8a-8c79-beec5040bd6b@opensynergy.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20231218064253.9734-4-peter.hilber@opensynergy.com>
 <87wmt63w1l.fsf@redhat.com>
 <a284ed4f-9ca1-4b8a-8c79-beec5040bd6b@opensynergy.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 15 Jan 2024 16:54:33 +0100
Message-ID: <87wmsamw1y.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: Re: [virtio-comment] [RFC PATCH v3 3/4] virtio-rtc: Add alarm feature

On Thu, Jan 11 2024, Peter Hilber <peter.hilber@opensynergy.com> wrote:

> On 22.12.23 19:57, Cornelia Huck wrote:
>> On Mon, Dec 18 2023, Peter Hilber <peter.hilber@opensynergy.com> wrote:
>> 
>>> Add the VIRTIO_RTC_F_ALARM feature (without normative statements).
>>>
>>> The intended use case is: A driver needs to react when an alarm time has
>>> been reached, but the driver may be in a sleep state or powered off at
>>> alarm time. The alarm feature can resume and notify the driver in this
>>> case. Alarms may be retained across device resets (including reset on
>>> boot).
>> 
>> Does the driver have some kind of control or information about whether
>> alarms are retained? I.e. to start with a clean slate, if wanted.
>
> As of now, the driver can disable the alarm through
> VIRTIO_RTC_REQ_SET_ALARM_ENABLED. If the driver does this before making
> buffers available to the alarmq, the device behaves like starting with a
> clean slate, with two exceptions:
>
> - VIRTIO_RTC_REQ_READ_ALARM might return a different alarm time than the
>   one at the first reset (but the alarm would be disabled).
>
>   If adding the minimum allowed alarm time to the spec, as was discussed in
>   the "Open Questions" section of the patch, initializing to the minimum
>   allowed alarm time could also become part of the "clean slate", so that
>   this exception would be removed.

Makes sense to me.

>
> - The requirements currently allow a "grace period" after disabling through
>   VIRTIO_RTC_REQ_SET_ALARM_ENABLED, during which the device could still
>   give the alarm notification, or execute custom alarm actions.
>
>   The draft spec permits alarm actions to continue for a short time after
>   the alarm has become obsolete, in order to not unnecessarily restrict
>   implementations. While I would not consider a sporadic-looking alarm
>   notification (which the driver can easily recognize as such) to be a
>   problem, the spec does not require to immediately cancel an obsolete
>   custom alarm action either.
>
>   But the requirements could be tightened so that all the actions have to
>   be completed or canceled before the device marks
>   VIRTIO_RTC_REQ_SET_ALARM_ENABLED as used:
>
>       If the driver successfully requests VIRTIO_RTC_REQ_SET_ALARM, or
>       VIRTIO_RTC_REQ_SET_ALARM_ENABLED, for clock C, the device MUST stop
>       serving any previous alarm expiration event for C before the device
>       marks the message as used.
>
>   This would remove the second exception.

This makes sense to me as well.

>
> I think I will just do the two above changes, if nobody objects.

Maybe also add a sentence that describes what the driver needs to do if
it doesn't want to get existing alarms? That might make things easier
for people who wish to write a driver, even if all of the needed
information can already be found in the spec.


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

