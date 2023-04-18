Return-Path: <virtio-comment-return-5517-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45345C77B76
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 12:31:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A1C21120D4A
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 12:31:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 972C6986411
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 12:31:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8E65A9863E3; Tue, 18 Apr 2023 12:31:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 78B24986408
	for <virtio-comment@lists.oasis-open.org>; Tue, 18 Apr 2023 12:31:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: E1ylcNQYOxiOB-LkwbT3GQ-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, Halil Pasic <pasic@linux.ibm.com>
Cc: "mst@redhat.com" <mst@redhat.com>, "virtio-dev@lists.oasis-open.org"
 <virtio-dev@lists.oasis-open.org>, "sgarzare@redhat.com"
 <sgarzare@redhat.com>, "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>
In-Reply-To: <PH0PR12MB5481881DEA4B7B7E182510E0DC9D9@PH0PR12MB5481.namprd12.prod.outlook.com>
Organization: Red Hat GmbH
References: <20230411192341.751841-1-parav@nvidia.com>
 <20230411192341.751841-4-parav@nvidia.com>
 <20230417054149.5d7f62e8.pasic@linux.ibm.com>
 <PH0PR12MB548148EDDB407D4B1A3E316ADC9C9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230418133958.13d5b98b.pasic@linux.ibm.com>
 <PH0PR12MB5481881DEA4B7B7E182510E0DC9D9@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 18 Apr 2023 14:31:40 +0200
Message-ID: <877cu974nn.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: Re: [virtio-comment] RE: [virtio-dev] [PATCH v13 03/11] content:
 Rename confusing queue_notify_data and vqn names

On Tue, Apr 18 2023, Parav Pandit <parav@nvidia.com> wrote:

>> From: Halil Pasic <pasic@linux.ibm.com>
>> Sent: Tuesday, April 18, 2023 7:40 AM
>> 
>> IMHO VIRTIO_F_NOTIFY_CONFIG_DATA should remain aligned with
>> VIRTIO_F_NOTIFICATION_DATA in one way or another. Thus way out would be
>> to do something like:
>> virtio_pci_common_cfg.queue_notify_data -> queue_notif_config_data
>> 
>> I think as editors Connie and Michael should have the most say in this though.
>
> Are you ok with above name?

I still need to read through the whole thing.


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

