Return-Path: <virtio-comment-return-5509-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27612C77B71
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 06:05:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 45E863E30A
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 06:05:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85354986406
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 06:05:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 701B4984043; Tue, 18 Apr 2023 06:05:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 948669863E3
	for <virtio-comment@lists.oasis-open.org>; Tue, 18 Apr 2023 06:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ko6Xj6__OD-9a2En_opxoA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681797855; x=1684389855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yimxm6GV1dRPRroF68NTKRBvI7pzzf56D/pj/jZK0gI=;
        b=K61lp8CJXMIckvDm570jKEwOLWossTPmLvM+AKrZIpi+8w4bFtHQdyWptAH3ZhxLsE
         qUerAGgPFCnRJ2yC8lIkSQSuuuVObaOOnUr6YScGgqclWw5umqZYJViW9VjXdY6MZfcz
         X26V/X6YwbSgjOWbTroq6z/MlZEt8L8lYCuvdh58pYw7kCVDqpA8am+mjghjOJYyXXoe
         eHOjsGJxYFp0pvJgyQD1v2kMpuSa7KzDtbpQewthxVnqJXDOOoYu/eHTq5fCrqdYg6Pi
         /ezwuSkCV2zEiymmG/mBSjOnSm7lx48piIIxVYcsIthJ72mM813TloH6jgKyle5Z4X9W
         O2yA==
X-Gm-Message-State: AAQBX9d0IioMsNluKKpsclmTrpuFdwwyzJClqlZ0gAA7LpQ7eqmD42x0
	f0k65GenN3mVEIY273SiHKNbRuPHKbu+sR+P2sH3yoLcNlNWAugpGpo0ijZ0j6craKvui0qlpBP
	o7tnV1b9Bdpfz4swsADnYOr6R/FhQ8h1D2A==
X-Received: by 2002:a5d:43c2:0:b0:2f5:83a8:a9a9 with SMTP id v2-20020a5d43c2000000b002f583a8a9a9mr761160wrr.16.1681797855825;
        Mon, 17 Apr 2023 23:04:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350aShdT6LUmneDDO3zt/q+BJxu1DeZ9shtkB1JIunlsbGJn6U5U2KER/0BOohZOip6AGhhqP0w==
X-Received: by 2002:a5d:43c2:0:b0:2f5:83a8:a9a9 with SMTP id v2-20020a5d43c2000000b002f583a8a9a9mr761144wrr.16.1681797855547;
        Mon, 17 Apr 2023 23:04:15 -0700 (PDT)
Date: Tue, 18 Apr 2023 02:04:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Halil Pasic <pasic@linux.ibm.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230418020150-mutt-send-email-mst@kernel.org>
References: <20230411192341.751841-1-parav@nvidia.com>
 <20230411192341.751841-4-parav@nvidia.com>
 <20230417054149.5d7f62e8.pasic@linux.ibm.com>
 <PH0PR12MB548148EDDB407D4B1A3E316ADC9C9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548148EDDB407D4B1A3E316ADC9C9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] [PATCH v13 03/11] content: Rename confusing
 queue_notify_data and vqn names

On Mon, Apr 17, 2023 at 08:53:32PM +0000, Parav Pandit wrote:
> > > @@ -1053,9 +1059,9 @@ \subsubsection{Available Buffer
> > > Notifications}\label{sec:Virtio Transport Option  If
> > VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:
> > >  \begin{itemize}
> > >  \item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the
> > > driver MUST use the -\field{queue_notify_data} value instead of the virtqueue
> > index.
> > > +\field{queue_notify_id} value instead of the virtqueue index.
> > >  \item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver
> > > MUST set the -\field{vqn} field to the \field{queue_notify_data} value.
> > > +\field{vq_notify_id} field to the \field{queue_notify_id} value.
> > 
> > Seems you did not catch these with the s/_id/_config_data/. By doing the
> > replace one would get queue_notify_config_data, vq_notify_config_data and
> > queue_notify_config_data respectively.
> > 
> > But that still does not seem right, and the right answer depends on to what do
> > we rename \field{vqn}.
> > 
> vqn -> vq_notif_config_data in the notification structure.
> 
> virtio_pci_common_cfg.queue_notify_data -> queue_notify_config_data.
> 
> Better to rename
> 
> VIRTIO_F_NOTIF_CONFIG_DATA to VIRTIO_F_NOTIFY_CONFIG_DATA.
> Adding "Y" is not going to make it that long. Field names will have some consistency.
> WDYT?

I think this NOTIF stands for "notification", not "notify".

-- 
MST


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

