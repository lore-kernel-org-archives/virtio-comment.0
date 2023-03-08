Return-Path: <virtio-comment-return-4815-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE61C6FD1E
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 17:25:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 16C933309D
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 17:25:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1001598670A
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 17:25:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 081CB9866F3; Wed,  8 Mar 2023 17:25:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC5189866F4
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Mar 2023 17:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: EoqNL2aCMj-dmB-H_GJntw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678296304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMR1+cklR3Qh1TBpptTQ/ElZCO/VAT6ZrfM0l5AOoxY=;
        b=amE0G27FfziJgiFZ1XihedT3CRBUV8xScyLushGAVJQZ5wJDKkE7GQc7m6ZSJ+7TFd
         3swrGTILGmmqyb51IPmZabAqU0lN5yLoVuj1C1/dFFUP6p+pPgPpZcKgiZdcfYtvBMDJ
         GnYP5T2yU5kaRmlXO3z4C55gu+VjiwQwU0Ax1z1jmvW735hkql0zCsqaTdOibqsES/42
         ShKr0zAM1Im5+Fauh34gx1WvhpwIgX0fgVLbOsH8bKSKHO9bDJ2I2AD4lpi9DvwoT+Oy
         k5Fz65InfAbJyngb9cuy3uDAw/YjKfUke7nVivMmcR0BZulZKMRBeqG0EOi/+1Zfi1SL
         kJFA==
X-Gm-Message-State: AO0yUKUWD6uRhXqtDxbYOIaFMiaEngxXVNIrnHHo3cN3gTm9f0ooE+dN
	aNyHwmGwiq4Ee6jv3c7hniB6RZeQRERsHe3vjJ13A22WWZXPfkYF9FVuDd/pO2gn0zDgfxufYNx
	5H3cqQa/Bzm75aeVIYLVOwwtlS+eYcYCGGg==
X-Received: by 2002:a17:906:7fc2:b0:8e4:dd4d:7b07 with SMTP id r2-20020a1709067fc200b008e4dd4d7b07mr18197858ejs.15.1678296304481;
        Wed, 08 Mar 2023 09:25:04 -0800 (PST)
X-Google-Smtp-Source: AK7set+Xf+dHR1d/ssoU5yHRjD5sDJA2wW3+PyvpsOF9wlvnbVrVYB9yPvcngMwPFNetB9/GMHyt/Q==
X-Received: by 2002:a17:906:7fc2:b0:8e4:dd4d:7b07 with SMTP id r2-20020a1709067fc200b008e4dd4d7b07mr18197834ejs.15.1678296304217;
        Wed, 08 Mar 2023 09:25:04 -0800 (PST)
Date: Wed, 8 Mar 2023 12:25:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: David Edmondson <david.edmondson@oracle.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20230308122332-mutt-send-email-mst@kernel.org>
References: <20230301141027.59500-1-hengqi@linux.alibaba.com>
 <m2lekf1iq8.fsf@oracle.com>
 <20230306175558-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A9D8A005A61139535CF7DCB49@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481A9D8A005A61139535CF7DCB49@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v10] virtio-net: support the virtqueue
 coalescing moderation

On Wed, Mar 08, 2023 at 04:42:25PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, March 6, 2023 5:57 PM
> > 
> > On Thu, Mar 02, 2023 at 11:36:18AM +0000, David Edmondson wrote:
> > > > +                                        for an enabled transmit/receive virtqueue whose
> > number is \field{vqn}.
> > >
> > > Should this now be "whose index is \field{vqn}"?
> > 
> > Ugh.  I guess we'll have to fix the number/index mess in the spec first. Parav
> > you said you are looking into it?
> 
> Yes, I want to send v1 for " Rename queue index to queue number" series.
> V1 will include,
>  
> a. the vqn changes for net device rss and 
> b. other ccw changes that Cornelia requested.
> c. extra note that you asked to add to mmio for referring the old naming convention
> 
> I guess we agree that it should be vqn.
> Therefore, vq coalescing and aq series should progress with vqn terminology.
> This way all 3 series can progress in parallel (aq, vq coalescing, current spec cleanup).

Don't much care at this point but I think when I thought about this
deeply it seemed that yes, it is marginally better. Don't remember why
though ;)

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

