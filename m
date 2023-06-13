Return-Path: <virtio-comment-return-6319-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86527C7EE29
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 07:53:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B407B7A1C8
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 07:53:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A1FF5986575
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 07:53:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 90A489842EA; Tue, 13 Jun 2023 07:53:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7DB4C98653E
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Jun 2023 07:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: juaRp3HPP0eezJCMaHDSJw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686642797; x=1689234797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShtdxZxsKyMNAz66I1lVPdIiWvXUJxgjpfsHcQ72o4E=;
        b=LOVaaVSEpZTWsMBEfrjM3YjjiPJ+D+hamoETWLNA8SKPaDw+VLIytu6A+FGkVTS7Ak
         VjTkv0xniVURHNrs1HY3NMmujI9yRXCxJ9z1VLYfbybgPHCB/No+nLI4W3tndQUzzFOS
         NHEMbmH9S7BgTN0i+3ZFlarUtTJdjxB2ky7cQu5doeKznv2Ss6kNKdlIEBta44Y521me
         VGboZVJZKInjjoYSCFcitxj1+EhSihca8slnU/moRj7jTxUOw7I81jTSk5SuSS+2GPtC
         HXYs0SkBGmzwwVHq5N8SjPuYPFW+lhzwVCoX08cLnclbvgw8YuU9qk2qOxUrqz5fwGjd
         HXog==
X-Gm-Message-State: AC+VfDzMhE3zB6IRJe/Lr9IsbPQts6eO3SM/OKc0Vou5yg3+j+EIl3HD
	ZOJerUnxOuH6twqF2LTgoEqUg2H+tZBpB8Ev/uAwDBrQfe+1p9HfSpWdUdAOur7YQG95DiVaCin
	ujH0rYupopH2SwsR3MAGCaJtlWBkhYJrq2Q==
X-Received: by 2002:a05:622a:188c:b0:3f4:f58d:d00d with SMTP id v12-20020a05622a188c00b003f4f58dd00dmr14959609qtc.40.1686642797135;
        Tue, 13 Jun 2023 00:53:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6sEneK6E6RqPx5VhiOkvVoo85XLvnh3oA19Z/cTL4sh3PA2m325yrJHJ3JrUqz09aUsczu2A==
X-Received: by 2002:a05:622a:188c:b0:3f4:f58d:d00d with SMTP id v12-20020a05622a188c00b003f4f58dd00dmr14959597qtc.40.1686642796869;
        Tue, 13 Jun 2023 00:53:16 -0700 (PDT)
Date: Tue, 13 Jun 2023 03:53:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtio-comment@lists.oasis-open.org,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	cohuck@redhat.com, alvaro.karsz@solid-run.com,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com,
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com,
	stefanha@redhat.com, Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com,
	si-wei.liu@oracle.com
Message-ID: <20230613035132-mutt-send-email-mst@kernel.org>
References: <CACGkMEsjJHOcx+D5V=oiQ25Efro-etADmbpDdDXS4Ufk5guoEA@mail.gmail.com>
 <20230608020335-mutt-send-email-mst@kernel.org>
 <CAJaqyWfC0nhQJiwH4iuE_+L+55G=4=P_5HXwMVyGjeUJqa392Q@mail.gmail.com>
 <20230608031325-mutt-send-email-mst@kernel.org>
 <CAJaqyWf+vn06NHcQY208dwyB=WH3PQ3A7z53o0BTy102XrT+3Q@mail.gmail.com>
 <20230608180617-mutt-send-email-mst@kernel.org>
 <CAJaqyWf-=R+KHfBjzrGzkunTdeV8sAgFUv_kYoxNo3uqH2OOSw@mail.gmail.com>
 <20230609115250-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
 <20230613034216-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230613034216-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Tue, Jun 13, 2023 at 03:46:35AM -0400, Michael S. Tsirkin wrote:
> On Mon, Jun 12, 2023 at 09:56:57AM +0200, Eugenio Perez Martin wrote:
> > > > Another drawback of that is the long time a device can spend to
> > > > reconfigure its memory maps.
> > >
> > > The map is already used for cvq though, I don't see why it would take
> > > much more with this.
> > >
> > 
> > In the case of vDPA HW, CVQ maps may not need to reach the device's or
> > platform IOMMU, so the modification of that mapping is way cheaper.
> 
> Oh, I get it. It's setup time, but you are right.
> 
> > > > taking that into account, does it make
> > > > sense to send a new version with the bit 1 on enable?
> > > >
> > > > Thanks!
> > >
> > > Current hardware won't support the extra bit though.


Thinking more about this, I think the following works:

- enable all queues before DRIVER_OK
- reset all data queues before DRIVER_OK
- DRIVER_OK
- CVQ commands
- re-enable data queues


No?



> -- 
> MST


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

