Return-Path: <virtio-comment-return-5210-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D213C761A6
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 08:15:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C193226A2B
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 08:15:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BB54C98658F
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 08:15:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B370F9863E5; Tue,  4 Apr 2023 08:15:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A34779863F0
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Apr 2023 08:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: HGB1506yO4SAzZLBwt-ppg-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, "mst@redhat.com" <mst@redhat.com>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>
Cc: "sgarzare@redhat.com" <sgarzare@redhat.com>,
 "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>
In-Reply-To: <PH0PR12MB54816C0F0759AAD5E9C76604DC929@PH0PR12MB5481.namprd12.prod.outlook.com>
Organization: Red Hat GmbH
References: <20230329212341.465843-1-parav@nvidia.com>
 <20230329212341.465843-9-parav@nvidia.com> <87tty2fvjj.fsf@redhat.com>
 <PH0PR12MB54816C0F0759AAD5E9C76604DC929@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 04 Apr 2023 10:15:14 +0200
Message-ID: <87edp0jc6l.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: Re: [virtio-comment] RE: [PATCH v10 8/8] virtio-net: Describe RSS
 using rss rq id

On Mon, Apr 03 2023, Parav Pandit <parav@nvidia.com> wrote:

>> From: Cornelia Huck <cohuck@redhat.com>
>> Sent: Thursday, March 30, 2023 5:17 AM
>> > +Field \field{indirection_table} is an array of receive virtqueues.
>> 
>> "an array of receive virtqueues identified via their rss_rq_id" ?
> No need to make it this verbose. It is evident from the definition itself.
>
>> 
>> >
>> >  A driver sets \field{max_tx_vq} to inform a device how many transmit
>> virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>> >
>> > @@ -1455,7 +1465,8 @@ \subsubsection{Control
>> > Virtqueue}\label{sec:Device Types / Network Device / Devi
>> >
>> >  A driver MUST NOT send the VIRTIO_NET_CTRL_MQ_RSS_CONFIG command
>> if the feature VIRTIO_NET_F_RSS has not been negotiated.
>> >
>> > -A driver MUST fill the \field{indirection_table} array only with indices of
>> enabled queues. Index 0 corresponds to receiveq1.
>> > +A driver MUST fill the \field{indirection_table} array only with
>> > +enabled receive virtqueues.
>> 
>> "only with rss_rq_id references to enabled receive virtqueues" ?
>> 
> In this field and other fields, we just refer to the receive virtqueues as rss_rq_id parent structure itself is describing what it is.
> Hence, we omit re-iterating rss_rq_id at multiple places.

Personally, I'd prefer to spell it out, as it is a specific way to refer
to a virtqueue.


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

