Return-Path: <virtio-comment-return-8544-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819E3C61D92
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:48:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D46B52AEE2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:48:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B7FC09868A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:48:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A1FAC986894; Wed, 22 Nov 2023 07:48:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 913F2986895
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 07:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: W_jUEEvhOw20q2pSBsFpRQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700639316; x=1701244116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AY6VUSuIhWPE057SJC/rJ0dKKEJGmgbx1tgL4/DVZiA=;
        b=mKif9Ojg5dM1KjH5wLMCNm5yQn7IPEDIbngFAOp/QAL607eoMHnnqbF2wd7w/PKFbA
         CFoBlOrMrtOeusKR6CYvBNutVYiRLH/baR+kwYGZvFiJPZh5tFOXLNgC+AB4lMmyATHh
         SpwtEU560ufclbMyzhWgghhWDO551kgkqXkSNhklzFpCTdxKaV9pZybsdkZyQdyWAeIU
         yZpasF1qrrbKmW9a9JzPzvoaOTCkwXGmBEozyTnLpHh+/+jTlxdoSyz0J99iyzgODOIO
         8dY9N8Pq1vJ/gpc+/SO7wFlx+03+8GxvT25fDFVjtZaBHZDbxV5sDYTGcV87jaox00fl
         LC2g==
X-Gm-Message-State: AOJu0YyKfPYeDSNg0d5mro4RV06F7AZUQ/qxh1Ne1tsitO/J/3fsPL+b
	u1B3Ngm5rS8SeAP1IVltZySngJ7DQHPMTvo2Bp/FwFQ9If+7zRjhnV/YNr4RqmPV7PnJcI7D75r
	/BgAyLiu31vRnitHfSBTbE+W+YjrgCCrHPA==
X-Received: by 2002:ac2:52ae:0:b0:509:493d:25a3 with SMTP id r14-20020ac252ae000000b00509493d25a3mr986844lfm.11.1700639316215;
        Tue, 21 Nov 2023 23:48:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERSYOn6U2fNpoJLmnFYRTTsWrCCjbbzxxby2laqW1waiqb+0U1XldbnFkwSvUXtRIWi5L3fQ==
X-Received: by 2002:ac2:52ae:0:b0:509:493d:25a3 with SMTP id r14-20020ac252ae000000b00509493d25a3mr986834lfm.11.1700639315884;
        Tue, 21 Nov 2023 23:48:35 -0800 (PST)
Date: Wed, 22 Nov 2023 02:48:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231122024459-mutt-send-email-mst@kernel.org>
References: <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com>
 <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116012208-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F4CE5686AE4BEA826C1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvU2sqVXAeEUykia2M-6rP1_nMemPH8eNZTEoHR0wUfog@mail.gmail.com>
 <PH0PR12MB5481FEDBA21656E29452AC78DCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEudhoDfY2ZcuA3J0ww=9Pm7qcMRasvZ8CvBeGVL9SPMDw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEudhoDfY2ZcuA3J0ww=9Pm7qcMRasvZ8CvBeGVL9SPMDw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Wed, Nov 22, 2023 at 12:13:34PM +0800, Jason Wang wrote:
> > > What's wrong if we just allow them to be R/W over adminq/cmmands?
> > >
> > As explained before,
> > Each guest has its own dedicated non mediated interface as defined in virtio spec to not involve hypervisor.
> 
> So what's wrong with inventing per VF queue to do that? For example
> transport virtqueue.

Nothing is wrong with this.

But what is problematic is just re-using config space for migration because
it means we can not just say "don't access device after it is stopped"
because yes you need to access it to save/restore state.
And a new interface over admin cmds just for this side-steps the
issue nicely.

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

