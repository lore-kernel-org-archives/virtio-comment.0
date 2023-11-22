Return-Path: <virtio-comment-return-8549-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2BFC61D9B
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 11:26:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5025C2AD51
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 11:26:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 30FDB9868A6
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 11:26:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0F2E0986895; Wed, 22 Nov 2023 11:26:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F2F45986896
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 11:26:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: EKsYaxdqPa63UR1sdgU0ow-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>
Cc: "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
 "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
In-Reply-To: <PH0PR12MB54817956B291856378B4B013DCB4A@PH0PR12MB5481.namprd12.prod.outlook.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231110123853.2093309-1-parav@nvidia.com>
 <PH0PR12MB54817956B291856378B4B013DCB4A@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 22 Nov 2023 12:26:46 +0100
Message-ID: <87cyw2kozt.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] RE: [PATCH v6 0/5] virtio-net: Support flow filter for receive packets

On Mon, Nov 20 2023, Parav Pandit <parav@nvidia.com> wrote:

> Hi Cornelia, Michael,
>
>
>> -----Original Message-----
>> From: Parav Pandit <parav@nvidia.com>
>> Sent: Friday, November 10, 2023 6:09 PM
>> To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
>> cohuck@redhat.com
>> Cc: sburla@marvell.com; Shahaf Shuler <shahafs@nvidia.com>; si-
>> wei.liu@oracle.com; xuanzhuo@linux.alibaba.com; Parav Pandit
>> <parav@nvidia.com>
>> Subject: [PATCH v6 0/5] virtio-net: Support flow filter for receive packets
>> 
>> Summary:
>> ========
>> This series improves virtio net receive packet steering to forward/steer packets
>> to specific RQ.
>> 
>> This basic functionality will enable Linux ethtool steering, Accelerated receive
>> flow steering (ARFS) as starting point, and more use cases in future.
>> 
>> Problem statement:
>> ==================
>> Currently packet allow/drop interface has few limitations.
>> 
>> 1. Driver cannot add or delete an individual entry for mac and vlan.
>> 2. Driver cannot select mac+vlan combination for which
>>     to allow/drop packet.
>> 3. Driver cannot not set other commonly used packet match fields
>>     such as IP header fields, TCP, UDP, SCP header fields.
>> 4. Driver cannot steer specific packets based on the match
>>    fields to specific receiveq.
>> 5. Driver do not have multiple or dedicated virtqueues to
>>     perform flow filter requests in accelerated manner in
>>     the device.
>> 
>> Solution:
>> =========
>> Flow filter as a generic framework to overcome above limitations.
>> 
>> Overview:
>> =========
>> A flow filter defines the flow based on one or more match fields of the packet,
>> defines an action like drop/forward to RQ.
>> 
>> The flow filters are organized in flow filter groups so that their processing can be
>> ordered when multiple applications wants to use it.
>> 
>> Flow filters requests can be transported via control vq or dedicated flow filter
>> virtqueue so that it does not get intermixed with other slow operations of cvq.
>> 
>> Flow filter requirements addressed by this series is worked by virtio community
>> at [1].
>> 
>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
>> 
>
> Now that this has been mature phase and on list for several weeks,
> I updated the github to point to v6.
>
> Can you please start the voting process?

I don't feel like I'm capable of judging the networking parts, but I
have a couple of wording suggestions (things like definite articles
etc.) Would you prefer a respin, or a vote now and an editorial patch on
top? I can either comment now, or start voting.


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

