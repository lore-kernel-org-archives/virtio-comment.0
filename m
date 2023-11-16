Return-Path: <virtio-comment-return-8406-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18F6C54FB9
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 11:48:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F2E311318C8
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 11:48:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D0764986DE8
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 11:48:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B6E9D986DDC; Thu, 16 Nov 2023 11:48:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A685B986DDD
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 11:48:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: WhpNxTejOTS1U6n5OgU1Iw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700135309; x=1700740109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9T1TAO/BSMsuBSZ7xdNFX/f5aWdSmaNCYwBj7JxFvMI=;
        b=NzumdVqjeMCOe2mrjOutX1bzOwqUt6aLj+tMeapUUhe3SMVYLCg9E0q3uPPouBM7Vt
         za95WbCo/ddMWlY7XgDAxlmxtSMz6aXXt/TKB7PSsV68T1dHwsF70EDZQPjW7Ua+27e1
         C2+gZ6eOiq4qKPohl+Pd9hszxvPS00jz7XqxUPErSgPAR805FoXv34X4g6ltG2dCe9N/
         PWLRwpFOtzkrkXnlonfaAbhin8iS3n0W1AS3Rrc29DiW3qmq0Fn/hKtfwZVN8tvJCZ4Y
         ft5f+F3VP+lt0y60pRbFsE6eHz27pGqEwXu1vccKDykszoxgpcO/dvZ0bFSC5T81CXj0
         Fddg==
X-Gm-Message-State: AOJu0Yxqkn+RMsqT3zASAk7cdwH2EsJelu4Rm4addaaOwjVvoae6aJYc
	/5GUv2A7ID4JMayf4UFgBls2dL0+HUD3Q54mTXtmFXBqqIhBH0HInlzOAsS6z4zWjsCSPRCaW5K
	M9VGaGWeqH3ZGHiYhNFuSkEREPkv9WDa7+g==
X-Received: by 2002:a17:906:19d8:b0:9be:cdca:dadb with SMTP id h24-20020a17090619d800b009becdcadadbmr10970061ejd.69.1700135309377;
        Thu, 16 Nov 2023 03:48:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbE4Em+WIyinqCHqPVbi2zhTpqjjkDtaMb1erWAkLeAibOiaUj9WIL0d0BKYVo/ulIJSvLig==
X-Received: by 2002:a17:906:19d8:b0:9be:cdca:dadb with SMTP id h24-20020a17090619d800b009becdcadadbmr10970047ejd.69.1700135309056;
        Thu, 16 Nov 2023 03:48:29 -0800 (PST)
Date: Thu, 16 Nov 2023 06:48:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231116064611-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Thu, Nov 16, 2023 at 07:40:57AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, November 16, 2023 1:06 PM
> > 
> > On Thu, Nov 16, 2023 at 12:51:40AM -0500, Michael S. Tsirkin wrote:
> > > On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrote:
> > > > We should expose a limit of the device in the proposed
> > WRITE_RECORD_CAP_QUERY command, that how much range it can track.
> > > > So that future provisioning framework can use it.
> > > >
> > > > I will cover this in v5 early next week.
> > >
> > > I do worry about how this can even work though. If you want a generic
> > > device you do not get to dictate how much memory VM has.
> > >
> > > Aren't we talking bit per page? With 1TByte of memory to track ->
> > > 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > 
> > Ugh. Actually of course:
> > With 1TByte of memory to track -> 256Mbit -> 32Mbit -> 8Mbyte per VF
> > 
> > 8Gbyte per *PF* with 1K VFs.
> > 
> Device may not maintain as a bitmap.

However you maintain it, there's 256Mega bit of information.

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

