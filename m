Return-Path: <virtio-comment-return-5782-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895F4C77B78
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 18:50:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AD17E4454E
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 18:50:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7EFAF9866C0
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 18:50:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5CD309866B3; Thu,  4 May 2023 18:50:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A87F09866B5
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 18:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 8bIGnDnFOe6I0E7JHO-N1g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683226191; x=1685818191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qrLmUU46nyV9WB8t8lkreTTP55234ud6aDqdEkXOVc=;
        b=B54vJuxuUgIJhcqy9xivKXhv5koGzLGiyDwvB/7Xkw6uFipke5YwiVk/hcS5x+3mnc
         k2wrrrNvCaeQMSVjZmgy1lebuaPLayj0E0YI42K+ibWgcytlEs1xRcM5Ng00WTCI/siI
         tN1UPMRFpa01wi4Fg49mqA6jRuPjXLN4xiLVncYvqPjFKt9O2umO4vbQGEi8LsZx5t1O
         tcVlnQNskyaq6zjPeNt3PIMnkHFWWy2mQ8MwUFF4FEd40oCef1jvMJJxMMUsHKdlpLGJ
         GhOJdB6Hy2YEkXnHUaBlQ+zcfqSJM5K0CY/OkGfhGjmQxhij3ujpFx6fOk/FI8bi4EHV
         lJYA==
X-Gm-Message-State: AC+VfDx86VmmSx9rg4SuWLJA8UhSQKjkOgcY8FDKHyGk9KG9H7RummmX
	yr3c80e+7IQgF7S+zfiH8YJX112U3RtleblwaK7Tf1FCgS3bAvURZNIZAqQXYFNQuhyHtUJIfYc
	4ROdSBgrB8XjHjMeonuTTFz12+QiQSFn1fQ==
X-Received: by 2002:a1c:7201:0:b0:3f1:7972:429d with SMTP id n1-20020a1c7201000000b003f17972429dmr461293wmc.18.1683226191673;
        Thu, 04 May 2023 11:49:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4NIJv63T0zDgW59k4ub9dxlBS7rndeNSr620lLqcgwQc2YnFudOVr4et82kgz8kByrJo2R/g==
X-Received: by 2002:a1c:7201:0:b0:3f1:7972:429d with SMTP id n1-20020a1c7201000000b003f17972429dmr461286wmc.18.1683226191351;
        Thu, 04 May 2023 11:49:51 -0700 (PDT)
Date: Thu, 4 May 2023 14:49:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: David Edmondson <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230504144914-mutt-send-email-mst@kernel.org>
References: <20230504022959.547025-1-parav@nvidia.com>
 <20230504022959.547025-4-parav@nvidia.com>
 <m21qjw5fyh.fsf@oracle.com>
 <PH0PR12MB548100E1C4AD64EA35E22772DC6D9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548100E1C4AD64EA35E22772DC6D9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v16 03/11] content: Rename confusing queue_notify_data
 and vqn names

On Thu, May 04, 2023 at 06:33:38PM +0000, Parav Pandit wrote:
> 
> > From: David Edmondson <david.edmondson@oracle.com>
> > Sent: Thursday, May 4, 2023 10:28 AM
> 
> > >  \begin{description}
> > > -\item [vqn] VQ number to be notified.
> > > +\item [vq_index_config_data] Either virtqueue index or device supplied
> > > +      queue notification config data corresponding to a virtqueue.
> > 
> > vq_index_config_data doesn't exist.
> > 
> > Given that this is an anonymous union, perhaps:
> > 
> > \item [vq_index or vq_notif_config_data] Either ...
> 
> > >  \drivernormative{\paragraph}{Available Buffer Notifications}{Virtio
> > > Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device
> > Operation / Available Buffer Notifications} -If VIRTIO_F_NOTIF_CONFIG_DATA
> > has been negotiated:
> > > +
> > > +If VIRTIO_F_NOTIFICATION_DATA is not negotiated, the driver
> > > +notification MUST be a 16-bit notification.
> > > +
> > > +If VIRTIO_F_NOTIFICATION_DATA is negotiated, the driver notification
> > > +MUST be a 32-bit notification.
> > 
> > The above two should be inside itemize?
> 
> Both suggestions look good to me.
> Given rest of the patches are reviewed and it is already v16, I think I can cover them right after this in editorial changes after merging this.
> This way the majority of the work of this series and subsequent patches doesn't need to wait another week.

Did voting start already? If not you can post a new version
just before voting if you already know what you want to do.

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

