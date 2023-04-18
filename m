Return-Path: <virtio-comment-return-5511-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FDBC77B75
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 11:43:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 54BC38668A
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 11:43:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4BB3F98641F
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 11:43:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 418FF9863EA; Tue, 18 Apr 2023 11:43:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 327A79863EE
	for <virtio-comment@lists.oasis-open.org>; Tue, 18 Apr 2023 11:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: B4IW7pJdPvGDtFYoFGIqsQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681818199; x=1684410199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSVxkAWYVcAYM9MmphL1lhz6u6SleLiUfnKv5S/4kRg=;
        b=IV6/NBw2qfAhCvmxtRm/Leq+MWvHxW5s2FavUw7xbAKqDb5GoBNfVOwivwy4Wrkf40
         cAPndGXjgCN+iZIJxxj3hi1WPSquGBzTq/5Tc6E8DasaLvvyYohQo1PK7vFEQ2E1vSXl
         DNGYqleTcFwz2D84Q5fSXDrgMUu3M+PJxTpyTpOkau+lYelDsPgQj9FBupFobpPEQ5vp
         D094c9UojBMqlg4w4/DqxnxelECNAZxYqBtM3aHR3NVmHz+USXgoZZ0naITMphbsldzw
         Ajwga8FfEYSouS99Zrb9lo/R8Z5Z+uIiAmiDHXE7BAcYhd+oLGLS/VC9ueDeaA9XpiHG
         ZO0g==
X-Gm-Message-State: AAQBX9dILDtkY+0Z5/qkvVLwZf15O34Ar1DQAYQrqfY9Ai4qfgTR6CJs
	XeTX2YF1pwR+DmTDe253dabEAoDuduXDNr2yXINcVJbbtWrvqgouK8thk5pUZoiMqPNZduCcFpu
	T64pIJ7VJve0zrB0mBAUwWAfx8WqENOscQg==
X-Received: by 2002:adf:ea8b:0:b0:2f2:c46b:1eb5 with SMTP id s11-20020adfea8b000000b002f2c46b1eb5mr1784930wrm.59.1681818199720;
        Tue, 18 Apr 2023 04:43:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y97qGGEIm90ZjWqlLvDKfgIuJkZjZVzbWnLvF+51tfrCkNKj4JMgLigO8fLbXeBD/MV1HSYA==
X-Received: by 2002:adf:ea8b:0:b0:2f2:c46b:1eb5 with SMTP id s11-20020adfea8b000000b002f2c46b1eb5mr1784910wrm.59.1681818199422;
        Tue, 18 Apr 2023 04:43:19 -0700 (PDT)
Date: Tue, 18 Apr 2023 07:43:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230418074307-mutt-send-email-mst@kernel.org>
References: <20230411192341.751841-1-parav@nvidia.com>
 <20230411192341.751841-4-parav@nvidia.com>
 <20230417054149.5d7f62e8.pasic@linux.ibm.com>
 <PH0PR12MB548148EDDB407D4B1A3E316ADC9C9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230418133958.13d5b98b.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20230418133958.13d5b98b.pasic@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] [PATCH v13 03/11] content: Rename confusing
 queue_notify_data and vqn names

On Tue, Apr 18, 2023 at 01:39:58PM +0200, Halil Pasic wrote:
> On Mon, 17 Apr 2023 20:53:32 +0000
> Parav Pandit <parav@nvidia.com> wrote:
> 
> > > From: Halil Pasic <pasic@linux.ibm.com>
> > > Sent: Sunday, April 16, 2023 11:42 PM  
> [..]
> > >   
> > > > @@ -1053,9 +1059,9 @@ \subsubsection{Available Buffer
> > > > Notifications}\label{sec:Virtio Transport Option  If  
> > > VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:  
> > > >  \begin{itemize}
> > > >  \item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the
> > > > driver MUST use the -\field{queue_notify_data} value instead of the virtqueue  
> > > index.  
> > > > +\field{queue_notify_id} value instead of the virtqueue index.
> > > >  \item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver
> > > > MUST set the -\field{vqn} field to the \field{queue_notify_data} value.
> > > > +\field{vq_notify_id} field to the \field{queue_notify_id} value.  
> > > 
> > > Seems you did not catch these with the s/_id/_config_data/. By doing the
> > > replace one would get queue_notify_config_data, vq_notify_config_data and
> > > queue_notify_config_data respectively.
> > > 
> > > But that still does not seem right, and the right answer depends on to what do
> > > we rename \field{vqn}.
> > >   
> > vqn -> vq_notif_config_data in the notification structure.
> 
> I think I got what you mean. I intend to double check it
> in v14.
> 
> > 
> > virtio_pci_common_cfg.queue_notify_data -> queue_notify_config_data.
> > 
> 
> I have no strong opinion about this one.
> 
> > Better to rename
> > 
> > VIRTIO_F_NOTIF_CONFIG_DATA to VIRTIO_F_NOTIFY_CONFIG_DATA.
> > Adding "Y" is not going to make it that long. Field names will have some consistency.
> > WDYT?
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
> 
> Regards,
> Halil

Fine by me.

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

