Return-Path: <virtio-comment-return-7656-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D25CD98C7
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 06:02:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2F46C29FC9
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 06:02:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1544E9865E9
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 06:02:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F2D7F986191; Wed, 11 Oct 2023 06:02:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE9C89865E0
	for <virtio-comment@lists.oasis-open.org>; Wed, 11 Oct 2023 06:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: MLWXVScYO5-SpK1nxXyuZQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697004146; x=1697608946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3XR4aUZ3Cq8OXZ8IDauVLXQ2s+FdqiKeu7GVE2kqiI=;
        b=PShy1+XJrsc2JMj3XFtVzGfJvsMOoJ2uAkq5rz2piG1HLf1hzakVnJHTX/X5Are43E
         URtXG2GpPxHrV6rWd+5DlQJZCbx8xqIkZQIvUyximbH6M1moJkB7EJO+58mQSu/J4KU5
         ghfREwXFrq0lXtze18i+8+s9Hwqji6Pk7c06vvPgjpQUjU2uWoAVydXoeEHbf5wkSD1X
         oQrSXMUZe0eIy67U0QVACVMVc7esNZx2SZ6xavTS8pUxCixj0FliSXNmfpOrI2Ok9yLn
         v7Bxjb2/9OYtMLWT4OHrcrA9vmmN/keZdJYFZ09PI9GgavS0bipESbwSPFTfRD0Uc065
         mEcw==
X-Gm-Message-State: AOJu0YzV6raU5W+7KqARF0Tn2lWiwweop3nrn273ZC0EbGweK7IaQv/F
	BeGeZaK3UxXY4YqTu2MGwo7Aeg44qnIDwmq1vouR9bu7oYaovjOm5ywnr+4pkrm3Qd4Gl5KnAql
	lUo5WLDAjDdFqkSjg67XbQMA70M8gK/ofcA==
X-Received: by 2002:a5d:6909:0:b0:317:70da:abdd with SMTP id t9-20020a5d6909000000b0031770daabddmr17856987wru.59.1697004146273;
        Tue, 10 Oct 2023 23:02:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVGvc/m0x0ar+c0arqqEpB8Ih2Gg2+HtjNvBCm5dmxxqx9BEOS2Qrdn+msCW/ht5fM/Ozinw==
X-Received: by 2002:a5d:6909:0:b0:317:70da:abdd with SMTP id t9-20020a5d6909000000b0031770daabddmr17856958wru.59.1697004145865;
        Tue, 10 Oct 2023 23:02:25 -0700 (PDT)
Date: Wed, 11 Oct 2023 02:02:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Message-ID: <20231011015732-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB548029E1AAB8529339D22D4DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEswD2XLjRNzyqo9M-yT77PsOJqJmDLxSKd2ZOgqLYjjZQ@mail.gmail.com>
 <PH0PR12MB548143D2AB83CA90E7F1C9D6DCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsk7ZgmWuqm9U_Tych8+Ceu7X9RymQASeSS_ayB2PGTgg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsk7ZgmWuqm9U_Tych8+Ceu7X9RymQASeSS_ayB2PGTgg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Wed, Oct 11, 2023 at 11:14:14AM +0800, Jason Wang wrote:
> > > > > What's more, for the things that need to be synchronized, I don't
> > > > > see any descriptions in this patch. And if it doesn't need, why?
> > > > With which operation should it be synchronized and why?
> > > > Can you please be specific?
> > >
> > > See my above question regarding FLR. And it may have others which I haven't
> > > had time to audit.
> > >
> > Ok. when you get chance to audit, lets discuss that time.
> 
> Well, I'm not the author of this series, it should be your job
> otherwise it would be too late.
> 
> For example, how is the power management interaction with the freeze/stop?

Right. I think in the same way this allows passthrough BAR access
it should allow passthrough config access, that is document what
exactly is the requirement. is just atomicity enough? and should
we require something from driver too?

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

