Return-Path: <virtio-comment-return-7997-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180A3C25B67
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 11:46:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4BFDC2A88D
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 11:46:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 303B6986A94
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 11:46:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 17641986A91; Fri, 27 Oct 2023 11:46:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0760C986A92
	for <virtio-comment@lists.oasis-open.org>; Fri, 27 Oct 2023 11:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: SkgZYUBANLaO6CLTDlE7uQ-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
 <hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
 <xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
In-Reply-To: <PH0PR12MB548177BAE9336982471430C4DCDCA@PH0PR12MB5481.namprd12.prod.outlook.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWcFKGTpHSUsHePUA4sTp_NthrTs9dzdVKoRcuM6e0G-kA@mail.gmail.com>
 <PH0PR12MB5481402BCC52DCEBF6A90A7FDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026051240-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548176388094EBC243F879DBDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026052637-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F967B7040B19272D1253DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87msw4s794.fsf@redhat.com>
 <PH0PR12MB548177BAE9336982471430C4DCDCA@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 27 Oct 2023 13:46:08 +0200
Message-ID: <87jzr8s2yn.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Fri, Oct 27 2023, Parav Pandit <parav@nvidia.com> wrote:

>> From: Cornelia Huck <cohuck@redhat.com>
>> Sent: Friday, October 27, 2023 3:43 PM
>
>> > These are common commands defined across all device types in basic
>> facilities section.
>> > Those devices which has cvq, they define how to transport these generic
>> defined commands.
>> > Those devices which do not have cvq, but when they need dynamic resources,
>> they will define and create one cvq.
>> > As such devices will likely need more than just dynamic vq creation, for which
>> it will need cvq anyway.
>> 
>> I think that is too complicated: not all devices will want to add a control vq for
>> resource management, especially if other mechanisms are already in use. Just
>> using a generic mechanism guarded by a feature bit seems much simpler.
> Not really, if a complex device has dynamic resource management, it is likely to have more functionality than just q creation.
> And for some reason, even if it does not, having efficient control channel for non_init is needed anyway.
>
> It not about device wants to add/not_add a control vq. It is about how device a should offer dynamic resource management.
> From device point of view, it is equally complex for the hw device to build dynamic config registers for N VQs which it never knows whether it will be used or not.

"config registers" are transport specific. If they aren't an efficient
method, then the transport needs to come up with something else -- but
it's the task of the *transport* to provide something useful. The device
should not need to do anything beyond specifying that it can support
adding vqs dynamically, and exposing the upper boundary to the number of
queues.

>
> Out of 19 devices, 6 devices already has cvq.
> Out of remaining 13 devices, 12 devices have fixed number of queues as they small enough in functionality that won't need a scale and dynamism either.
> So for dynamic resource management reusing the existing cvq is more efficient for the devices.

They have a device-specific cvq, which is used in a device-specific way
for device-specific purposes. I don't see how turning them into
frankencvqs is "efficient".


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

