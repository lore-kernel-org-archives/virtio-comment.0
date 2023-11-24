Return-Path: <virtio-comment-return-8591-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AB8C61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 05:33:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 852152A899
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 05:33:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 73B029868A7
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 05:33:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 63BF19862D9; Fri, 24 Nov 2023 05:33:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 502789868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 05:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: gPNVsmwuPcyLnFmY0ZhbEw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700803977; x=1701408777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7Ndzxtj733G6A/+tvPaLIepe5HC+nRS0idkMDVwpnQ=;
        b=jyZI67dP/dop4gQ+E2PNZtkoXzLYV7TO4wc3YP7lhixoGZnrJ1Atam//fZ7Arlnr8E
         NgYD4em7958fCtBaGmznUqQorjC5bGU6Di+mwEzMW8jOAtBuxH4VyZyocHrhUp+HHgyA
         JV6PDyksHMD32T13yaC8+GtZ6KoibkeMuSX4m056h8ER78K/34ykWXDyT42BS7uub234
         YoKZD4F2vLkfcH2JYHBLp2OWM4cY+qIlSr6vNdkU4iZEOp10JziFz0ZWBXycuSw8LVyp
         GXi2sVcA9ZepX2FUYoVTCK/YRyOGGHjc0ADSDnHMkhV4L3pvBmfEWinoA3J6nzLFHFQc
         Q7OA==
X-Gm-Message-State: AOJu0YzcHt4HRpauHzI22Pk6fRcBAnxPplccdZt+0XGmheolmJ12U+BE
	Oiu+IIwPDkCzpY9qjlpyyhNmLzKx4SV5n6G0gtf/YwnlUw2pK5ZL1J7Ruk7KdwQKN6Y82S8/3Kg
	dsbr0U85LhEwmCinvCnB6yZfv5HAh4ADAYQ==
X-Received: by 2002:a17:906:3e58:b0:9ad:cbc0:9f47 with SMTP id t24-20020a1709063e5800b009adcbc09f47mr4198509eji.12.1700803977179;
        Thu, 23 Nov 2023 21:32:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExdhhoFLTdW+j2beLKgIbglAURUi9BJXYY4DPhkzyc1qg13jGjUy97g3NrD0mnwVm8P4i9+g==
X-Received: by 2002:a17:906:3e58:b0:9ad:cbc0:9f47 with SMTP id t24-20020a1709063e5800b009adcbc09f47mr4198487eji.12.1700803976340;
        Thu, 23 Nov 2023 21:32:56 -0800 (PST)
Date: Fri, 24 Nov 2023 00:32:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231124003129-mutt-send-email-mst@kernel.org>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

On Fri, Nov 24, 2023 at 12:02:23PM +0800, Jason Wang wrote:
> > > I won't be able to absorb this comment of DMA interface.
> > > If I discuss further, I will repeat the whole document [1] and I will avoid that now.
> > >
> > > [1] https://docs.google.com/document/d/1Iyn-l3Nm0yls3pZaul4lZiVj8x1s73Ed6rOsmn6LfXc/edit#heading=h.qexbtyc2jpwr
> >
> >
> > I really worry about how provisioning will work. And I do not at all
> > cherish replicating all of these query capability commands for provisioning.
> 
> +1
> 
> There's nothing that prevents the config space from being implemented
> in a way other than registers.

Care doing it finally? Let's see if what Parav is worrying about is then
addressed.

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

