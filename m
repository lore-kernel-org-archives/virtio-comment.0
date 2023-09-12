Return-Path: <virtio-comment-return-7325-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F45CA0EC3
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Sep 2023 03:44:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C53928504D
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Sep 2023 03:44:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85293986641
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Sep 2023 03:44:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7DF9F9864B9; Tue, 12 Sep 2023 03:44:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 631EC986639
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Sep 2023 03:44:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 0uXNL2FVOI23-iui6080uQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694490241; x=1695095041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0OO+nwsyzoy2ApNTU+Vnha5kkoOZIi/zBoroAVLuBU=;
        b=boshUoNc+md7tHZ47kku1sAM3d45GKY5iGarw98joDJ/2/sA4B0Cui6C8rPlbX2HTm
         EEKACGh341HF7P6TC1btVmGmkuLu6y6RNimh6IgHVnGXFWn4kyc1JQ6fWpq0VWgg0sTV
         Ee1nWZ6haaBs1557CO5oolpqVorij3F56F8oW+zbklEeW2vmCo3wbWukzSxGmNVEpmAx
         oI8eTSI1xhoS8SeLzuiamaYNdl73wVcatVuMcEPrLpKly2MmvvyahB6neXnvBu1kJJ9Q
         /m5ieGvcd0uiKdt+HDPwb3l62s5YDxGx2ofZOASULLn0Iog43a9Swz5m0s08mT2Xw1oI
         xhBg==
X-Gm-Message-State: AOJu0YxSaCkCtowFPPM9aK9Je+m3bpAJWpBF/spGp0NRn4HvcTN5P0Y9
	4zaEmVa7g2abdU3pn0DPk6ls/Dxvrm6m8/SzkC3+vXoD93rDl73doz2SByFlhDTmfblGGr6OyoA
	QQM9fv9aZqw7wSmWFa2I+kGoZ5azVlR6aCxjqZzQcTxnQAb0CDg==
X-Received: by 2002:a05:6512:250b:b0:500:b515:906d with SMTP id be11-20020a056512250b00b00500b515906dmr9443719lfb.61.1694490241046;
        Mon, 11 Sep 2023 20:44:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNDy+R8e0qLrpaTt57tU8he2MtV4WMoaI8Qi4I8Nu5StLKX+uQMeNTqwm9/9URxlzcNaaKNYCkth+vbz/m4bE=
X-Received: by 2002:a05:6512:250b:b0:500:b515:906d with SMTP id
 be11-20020a056512250b00b00500b515906dmr9443701lfb.61.1694490240660; Mon, 11
 Sep 2023 20:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-6-lingshan.zhu@intel.com> <20230906043016-mutt-send-email-mst@kernel.org>
 <CACGkMEu4R_nUFmpoNesmjJ-PtoE5brpWh8NLruWhEWycm2K4yg@mail.gmail.com>
 <PH0PR12MB5481A50B1B13CE1756B98D0DDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtMmwWGJDYe5BLvLCcetThv-yfPR2QbphNuuh+bp-+ikg@mail.gmail.com>
 <PH0PR12MB5481ED8DC23DC6D42665FB8EDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <eb6c350e-1198-7d83-a553-99c9c8c21edc@intel.com> <PH0PR12MB5481760E00AD18DB8BF91636DCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ad1dd3a6-7c11-5c6b-b50f-d608ec027dcd@intel.com> <PH0PR12MB54819C4A4220712DCD57AD56DCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fff7720f-6019-bd87-b14b-c0bf996f3959@intel.com> <PH0PR12MB5481D11A7DF45292103D9290DCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <88b8b14c-88d8-1f76-0e6e-7b5f334171f1@intel.com> <PH0PR12MB5481CBE0CDFF4ACD712F371CDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2b3e8da1-5cbb-f990-0c1d-c0e894a73486@intel.com> <PH0PR12MB5481E8114A659954251F17DCDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481E8114A659954251F17DCDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 12 Sep 2023 11:43:49 +0800
Message-ID: <CACGkMEtAe3j+A=gNEOJiZF8rcJnT-zw7Xg67LLM92FZCm0XqyQ@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH 5/5] virtio-pci: implement VIRTIO_F_QUEUE_STATE

On Mon, Sep 11, 2023 at 7:50=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
> > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > Sent: Monday, September 11, 2023 3:03 PM
>
> > By the way, do you see anything we need to improve in this series?
>
> Admin commands for passthrough devices of [1] is comprehensive proposal c=
overing all the aspects.

What do you mean by "all the aspects"?

Of course it can't handle nesting well, passthrough doesn't work when
your hardware has N levels abstractions but nesting is M levels. Trap
and emulation is a must.

And exposing the whole device to the guest drivers will have security
implications, your proposal has demonstrated that you need a
workaround for FLR at least.

For non standard device we don't have choices other than passthrough,
but for standard devices we have other choices.

Thanks

>
> To me [1] is superset work that covers all needed functionality and downt=
ime aspects.
>
> I plan to improve [1] with v1 this week by extending device context and a=
ddressing other review comments.
>
> [1] https://lists.oasis-open.org/archives/virtio-comment/202309/msg00061.=
html


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

