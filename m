Return-Path: <virtio-comment-return-8860-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CFAC41535
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 18:57:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C77282AEDC
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 18:57:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE6209865FF
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 18:57:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9492898427C; Fri, 22 Dec 2023 18:57:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 82AFC9865C1
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Dec 2023 18:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: cp2TiOQSNnGroqiSYMRllA-1
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Hilber <peter.hilber@opensynergy.com>,
 virtio-comment@lists.oasis-open.org
Cc: Peter Hilber <peter.hilber@opensynergy.com>, Parav Pandit
 <parav@nvidia.com>
In-Reply-To: <20231218064253.9734-4-peter.hilber@opensynergy.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20231218064253.9734-4-peter.hilber@opensynergy.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 22 Dec 2023 19:57:10 +0100
Message-ID: <87wmt63w1l.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: Re: [virtio-comment] [RFC PATCH v3 3/4] virtio-rtc: Add alarm feature

On Mon, Dec 18 2023, Peter Hilber <peter.hilber@opensynergy.com> wrote:

> Add the VIRTIO_RTC_F_ALARM feature (without normative statements).
>
> The intended use case is: A driver needs to react when an alarm time has
> been reached, but the driver may be in a sleep state or powered off at
> alarm time. The alarm feature can resume and notify the driver in this
> case. Alarms may be retained across device resets (including reset on
> boot).

Does the driver have some kind of control or information about whether
alarms are retained? I.e. to start with a clean slate, if wanted.

I'm not familiar with RTC, so I'm not sure if that even makes sense, or
if I have missed something in the spec.


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

