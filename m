Return-Path: <virtio-comment-return-8543-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAF7C072A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:44:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5042B1FF71
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:44:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2C5FB9868A3
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:44:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0F767986894; Wed, 22 Nov 2023 07:44:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F30F8986895
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 07:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: vvi3f7ZvP5CJ6mTI6FYstA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700639077; x=1701243877;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQfrpyP0blCTcLDS6Wg1W4L05PK1KjHr5xwAjAzTVQE=;
        b=rLwjOIuADSxMKkmRcCi6yLl77M6lQTKg4KO90P4zuiFoONx2VqkF8ipZKLKGbkyvm6
         rF4aJjKL4HZN7x9cAF98TV22hqGaXWBtkWzu8HYO24K8zkOThEKu34Z+SbiQSuUWFBPc
         Bn6UGvggnej2RXtmczkpO1tKNOQ+ukMTQAdEu02P1uiCiUuDZ6zpjbWfD++RIAY0N1iU
         lIzKyQ1rm0nxnfwPR3tryXZMjxpRH//JrOVEdaCvL0vieUbmTD+GOzOP+HHJiPusLFWI
         6iCbggyHa1O3hAJnf5jeclch4n1Nk8n7aiHDZ94tE5nKfkzTQl98c9JOY+BZlcEHkm8O
         +VtA==
X-Gm-Message-State: AOJu0YyHPagQRkJbdC7vPFB2B3JlLHeSx67mMK+7c2VUMlxJR+0phZe1
	ZYRrJdy7z7jBrbzj2Jpefhu+MEEBhooXtRWgWc+Shq8nG2GZOZ7e32vBZCvU8GaJLvEt96z/Q9x
	SbXJPdJns8ndFhB4cetj7jv78oUw+HF6mvg==
X-Received: by 2002:a50:d55e:0:b0:540:9d0c:75fc with SMTP id f30-20020a50d55e000000b005409d0c75fcmr961083edj.26.1700639076904;
        Tue, 21 Nov 2023 23:44:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIWY+N11arVrNgdcOdmyZTcTjxuN3bNr15LR3RZ4lmsKytmbpXVEeGnOA48QOq476nLZNC7A==
X-Received: by 2002:a50:d55e:0:b0:540:9d0c:75fc with SMTP id f30-20020a50d55e000000b005409d0c75fcmr961060edj.26.1700639076574;
        Tue, 21 Nov 2023 23:44:36 -0800 (PST)
Date: Wed, 22 Nov 2023 02:44:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231122023859-mutt-send-email-mst@kernel.org>
References: <20231117053117-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481632B9E440DDCBEEA7B75DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117062003-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548133582D377B3FE4BB9F6CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073917-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481CD9329189829A8A6B6D1DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtEEj8jXeE7JHyFk6UkBkEP5vpYzXPHHSGpSjDKQivJAg@mail.gmail.com>
 <PH0PR12MB5481036FE38E03DDFAE1D13CDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231121155805-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481660D3DC8EA45BFD7AAA3DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481660D3DC8EA45BFD7AAA3DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Wed, Nov 22, 2023 at 03:46:41AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, November 22, 2023 2:31 AM
> > 
> > On Tue, Nov 21, 2023 at 04:29:36PM +0000, Parav Pandit wrote:
> > > Basic test with iperf is not working. Crashing it.
> > > All of this is complete unrelated discussion to this series to slow down the
> > work.
> > > I don’t see any value.
> > > Michael asked to do the test, we did, it does not work. Functionally broken
> > code has no comparison.
> > 
> > It's unfortunate it's unstable for you, if you could show perf comparison that
> > would be a strong argument for your case. Reporting Linux/qemu failures to
> > virtio TC is not going to help you though, wrong forum.
> 
> As I explained, the basic requirements are not met hence, the comparison is not applicable.
> There is no point in discussing specific OS implementation anyway. You asked to remove vfio citations hence we remove other citations as well.
> 
> Thanks.

So it crashes, and even if it does not it does not perform well, and even
if it performs well it does not meet the requirements.
Really, you are shooting yourself in the foot with stuff like this.
Does not look good at all.

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

