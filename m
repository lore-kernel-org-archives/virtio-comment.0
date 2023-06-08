Return-Path: <virtio-comment-return-6262-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01E5C7EE25
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 19:01:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B4C647C677
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 19:00:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AB89E98669C
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 19:00:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A1BF9986689; Thu,  8 Jun 2023 19:00:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8A914986686
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 19:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -hkYsF3JNjKskwFIHcNSdA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686250850; x=1688842850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5Em1Yln+NUCKcxkgs9tdjKPowP2IUMRO6kM6uFd94M=;
        b=bPKJ4xCq3xxMN0RtrBYIK6RHm6KaG9lFDj8XgEVKb3+BZUcF3eHBx9ILHBPHuBMSrI
         fK3uP8v8HnBE/U/wrkYP5oD9tO8L+ciDR8jXyeOztd29PXRJ+4XJxLlDxo3itJo3jOR6
         YG3NvnniXGOZgH9yHVcpldVB+nwmXWi08KTMRyPb2fQL3sALnuYIEjfNg40kUSjKo4YS
         RnHdRy5N+U+ukSfV2UmKJ4urVmmUKywI3LXv2M8Wnnb5r4WIUzLNY6Q2uCVtmPOrk3jy
         Rgkd43iUJsEY/tikTZw1XgebmtBM+6790TY3nIPX0sLZgZL000OdT3r454R6AMCAmxW4
         jO4g==
X-Gm-Message-State: AC+VfDwgjKvvJfVTNsqH53akknw97ML5h4IaiRvJYNK/3/MuNVowLJ7/
	4RDAqjEmkNN9bTn1efm9pubIDaWZcuRibDASmARQDNhnMWudM6Q0wEpku+HkvmZ+N/vxN4POJKj
	UCgvzOnmXhzxwr4SsacEl2zXuicspMSfhtQ==
X-Received: by 2002:a05:6000:1972:b0:301:8551:446a with SMTP id da18-20020a056000197200b003018551446amr8052514wrb.2.1686250850665;
        Thu, 08 Jun 2023 12:00:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7X46aETPCkXem1pv8jkeQaiOSTZvLlRgxPUX77mTo1/+s8Upi9/Hcjb2hGP8WUf9SD3La2eA==
X-Received: by 2002:a05:6000:1972:b0:301:8551:446a with SMTP id da18-20020a056000197200b003018551446amr8052495wrb.2.1686250850379;
        Thu, 08 Jun 2023 12:00:50 -0700 (PDT)
Date: Thu, 8 Jun 2023 15:00:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230608145944-mutt-send-email-mst@kernel.org>
References: <20230602203604.627661-1-parav@nvidia.com>
 <20230602203604.627661-3-parav@nvidia.com>
 <20230608143135-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818BA9BDC5EAF4FA8388E4DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54818BA9BDC5EAF4FA8388E4DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 2/3] transport-pci: Introduce legacy registers access
 commands

On Thu, Jun 08, 2023 at 06:55:29PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, June 8, 2023 2:34 PM
> 
> > > +0x0003 & VIRTIO_ADMIN_CMD_LCC_REG_READ & Read legacy common
> > configuration registers of a member device    \\
> > > +\hline
> > > +0x0004 & VIRTIO_ADMIN_CMD_LD_REG_WRITE & Write legacy device
> > registers of a member device    \\
> > > +\hline
> > > +0x0005 & VIRTIO_ADMIN_CMD_LD_REG_READ & Read legacy device
> > registers of a member device    \\
> > > +\hline
> > > +0x0006 & VIRTIO_ADMIN_CMD_LQ_NOTIFY_QUERY & Read the queue
> > > +notification offset for legacy interface \\ \hline
> > 
> > Could you avoid such drastic abbreviation in command names?
> > Standard things like CMD,CFG are ok, but LCC/LD will not ring any bells for
> > anyone, except maybe confusingly make one think of "C Compiler" and "Link
> > eDitor".
> > Let's just LEGACY_COMMON_CFG/LEGACY_DEVICE_CFG?
> > 
> It looked too long before abbreviating it.
> Will change.
> 
> VIRTIO_ADMIN_CMD_LEGACY_COMMON_REG_READ 
> VIRTIO_ADMIN_CMD_LEGACY_DEV_REG_READ

I think you can drop _REG_ that does not really add any value
and does not match anything in the spec.  _CFG_ would make sense spec calls
this common configuration and device configuration.

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

