Return-Path: <virtio-comment-return-6793-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F319EB64DA
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Jul 2023 11:37:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CD97E2CAF1
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Jul 2023 11:37:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BE06498680A
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Jul 2023 11:37:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B622A9867EB; Fri,  7 Jul 2023 11:37:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A4CDB9867F9
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Jul 2023 11:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 0uJutzpAME6EK9ezC9NEKg-1
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, david.edmondson@oracle.com,
 virtio-dev@lists.oasis-open.org, sburla@marvell.com, jasowang@redhat.com,
 yishaih@nvidia.com, maorg@nvidia.com, shahafs@nvidia.com
In-Reply-To: <20230706183617-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
References: <20230706212722.97973-1-parav@nvidia.com>
 <20230706183617-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 07 Jul 2023 13:37:08 +0200
Message-ID: <87sfa00x7f.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [PATCH v11 0/3] admin: Access legacy registers using admin
 commands

On Thu, Jul 06 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Jul 07, 2023 at 12:27:19AM +0300, Parav Pandit wrote:
>> This short series introduces legacy registers access commands for the owner
>> group member access the legacy registers of the member VFs.
>> This short series introduces legacy region access commands by the group owner
>> device for its member devices.
>> Currently it is applicable to the PCI PF and VF devices. If in future any
>> SIOV devices to support legacy registers, they can be easily supported using
>> same commands by using the group member identifiers of the future SIOV devices.
>> 
>> More details as overview, motivation, use case are further described
>> below.
>
> corneli want to apply 1,2 as editorial?

I guess that makes sense to get them out of the way.


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

