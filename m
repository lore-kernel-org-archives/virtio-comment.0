Return-Path: <virtio-comment-return-5519-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF21C77B75
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 13:17:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6C99C3F548
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 13:17:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5ADCF9863EE
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 13:17:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 489FB9863E8; Tue, 18 Apr 2023 13:17:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 367B39863EA
	for <virtio-comment@lists.oasis-open.org>; Tue, 18 Apr 2023 13:17:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: EsG-xEBaMoSWnjStlNBLTw-1
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>, Parav Pandit <parav@nvidia.com>
Cc: "mst@redhat.com" <mst@redhat.com>, "virtio-dev@lists.oasis-open.org"
 <virtio-dev@lists.oasis-open.org>, "sgarzare@redhat.com"
 <sgarzare@redhat.com>, "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
 Halil Pasic <pasic@linux.ibm.com>
In-Reply-To: <20230418133958.13d5b98b.pasic@linux.ibm.com>
Organization: Red Hat GmbH
References: <20230411192341.751841-1-parav@nvidia.com>
 <20230411192341.751841-4-parav@nvidia.com>
 <20230417054149.5d7f62e8.pasic@linux.ibm.com>
 <PH0PR12MB548148EDDB407D4B1A3E316ADC9C9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230418133958.13d5b98b.pasic@linux.ibm.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 18 Apr 2023 15:17:11 +0200
Message-ID: <871qkh72js.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [virtio-dev] [PATCH v13 03/11] content: Rename confusing
 queue_notify_data and vqn names

On Tue, Apr 18 2023, Halil Pasic <pasic@linux.ibm.com> wrote:

> On Mon, 17 Apr 2023 20:53:32 +0000
> Parav Pandit <parav@nvidia.com> wrote:
>
>> > From: Halil Pasic <pasic@linux.ibm.com>
>> > Sent: Sunday, April 16, 2023 11:42 PM  
> [..]
>> >   
>> > > @@ -1053,9 +1059,9 @@ \subsubsection{Available Buffer
>> > > Notifications}\label{sec:Virtio Transport Option  If  
>> > VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:  
>> > >  \begin{itemize}
>> > >  \item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the
>> > > driver MUST use the -\field{queue_notify_data} value instead of the virtqueue  
>> > index.  
>> > > +\field{queue_notify_id} value instead of the virtqueue index.
>> > >  \item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver
>> > > MUST set the -\field{vqn} field to the \field{queue_notify_data} value.
>> > > +\field{vq_notify_id} field to the \field{queue_notify_id} value.  
>> > 
>> > Seems you did not catch these with the s/_id/_config_data/. By doing the
>> > replace one would get queue_notify_config_data, vq_notify_config_data and
>> > queue_notify_config_data respectively.
>> > 
>> > But that still does not seem right, and the right answer depends on to what do
>> > we rename \field{vqn}.
>> >   
>> vqn -> vq_notif_config_data in the notification structure.
>
> I think I got what you mean. I intend to double check it
> in v14.
>
>> 
>> virtio_pci_common_cfg.queue_notify_data -> queue_notify_config_data.
>> 
>
> I have no strong opinion about this one.
>
>> Better to rename
>> 
>> VIRTIO_F_NOTIF_CONFIG_DATA to VIRTIO_F_NOTIFY_CONFIG_DATA.
>> Adding "Y" is not going to make it that long. Field names will have some consistency.
>> WDYT?
>
> No strong opinion on this either. I agree with Michael that "NOTIF"
> likely stands for "notification", but I also see your point: having
> "notify" in the field names and "NOTIF" in the feature name isn't great
> either.
>
> IMHO VIRTIO_F_NOTIFY_CONFIG_DATA should remain aligned with
> VIRTIO_F_NOTIFICATION_DATA in one way or another. Thus way out would be
> to do something like:
> virtio_pci_common_cfg.queue_notify_data -> queue_notif_config_data
>
> I think as editors Connie and Michael should have the most say in this
> though.

Using "notif" throughout would probably be most consistent.


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

