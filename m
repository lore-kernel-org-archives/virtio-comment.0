Return-Path: <virtio-comment-return-6819-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5315EB64D9
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Jul 2023 03:09:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 330D42A887
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Jul 2023 03:09:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1E1C398657D
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Jul 2023 03:09:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 13EB498408C; Tue, 11 Jul 2023 03:09:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0117A986503
	for <virtio-comment@lists.oasis-open.org>; Tue, 11 Jul 2023 03:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DRXeKEaGMbufoOg5POI-sg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689044961; x=1691636961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOpPPVMKl2oD7PVr9kbp/u00YojXO6ExASg07EIM0HI=;
        b=Ro83ZRQ8CH+piZqgcO1/38h0ShnfNZrPID8M4s6L1ajEvL/mDhPQQ6kccszDMP4M2w
         WFRRzT80CwNznIYbnBJa/PUQqMYjnCxl9tgPtUZ8oPLjByJXpGfiaHvo3yzOeP0J+ylN
         4YFQISrgOUCNC6VQ+5/QnNtvkKpjcmUvuCwJrZ/J7SuvqliOCB3Fe1OzaWhigsChqJS1
         HsvEGFsgUVwixzNL8t5ZvIqYrwsvTbbfOd46EH86oHUW8CRTFEGi+wg9X87Pmteqx9XV
         HD52w84g5zWaZNGqlUrdN1RSuHW4zCkZoRG5D5Q8zGTvhSEG9hhJZsqVj3WOPMIa3ikw
         hOgQ==
X-Gm-Message-State: ABy/qLYUPQVo29yakJ0ehAaZNWUZzzf86wWy08YBY8JOxPePNjCPd9YC
	Cjds5UCkHO7Lv1c0uYDw6Sj93cCpcvT6N6K+5hO1X6FT9OVnbQ41CeF+eZ6HJQFe5on+dPEWsUL
	7KaYXcxS1HSBu7EjsgrqltPf86eFgnELbAViMi9YYkfhFXjzVpA==
X-Received: by 2002:a2e:b810:0:b0:2b7:361:8c26 with SMTP id u16-20020a2eb810000000b002b703618c26mr5100744ljo.25.1689044961450;
        Mon, 10 Jul 2023 20:09:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEGs1W8AbeFP+9X2jdXuq/bjZoVMKhcnFv1lCFaPtpa0NYZEg60/AGDV+fP3H/84URZjNJRqdS/gUw59wmShLY=
X-Received: by 2002:a2e:b810:0:b0:2b7:361:8c26 with SMTP id
 u16-20020a2eb810000000b002b703618c26mr5100726ljo.25.1689044961289; Mon, 10
 Jul 2023 20:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230606175511.2337208-1-eperezma@redhat.com> <CAJaqyWe6nR_5bAfuqBfDJY8T-OPfHcjoYbXMyEQEEgL5Oko8WQ@mail.gmail.com>
 <CACGkMEub3RmrXfagZk9CH1t9r=-vaVu6anqEREqw4nphh9PxPQ@mail.gmail.com>
 <20230710014740-mutt-send-email-mst@kernel.org> <PH0PR12MB5481EEBADA76385FAFA0EA4CDC30A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481EEBADA76385FAFA0EA4CDC30A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 11 Jul 2023 11:09:10 +0800
Message-ID: <CACGkMEseXhP2iJzLFuBXW7i2vTS9Gy2W=O+FtUR+pjQxDiFhKg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Laurent Vivier <lvivier@redhat.com>, 
	Cindy Lu <lulu@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"alvaro.karsz@solid-run.com" <alvaro.karsz@solid-run.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>, 
	"longpeng2@huawei.com" <longpeng2@huawei.com>, Dragos Tatulea <dtatulea@nvidia.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>, 
	Zhu Lingshan <lingshan.zhu@intel.com>, Shannon Nelson <snelson@pensando.io>, 
	Max Gurtovoy <mgurtovoy@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>, 
	Yan Vugenfirer <yvugenfi@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH 0/2] Selective queue enabling

On Mon, Jul 10, 2023 at 8:13=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, July 10, 2023 1:49 AM
>
> > I'm not sure we need to bother at this point. In linux we seem to have =
agreed to
> > use a mix of RING_RESET and a vdpa specific thing. Non-vdpa solutions d=
on't
> > seem to need this. Right Parav?
>
> Couldn=E2=80=99t follow all the emails, but yes, I agree with Michael tha=
t F_RING_RESET seems enough which is serving the purpose of dynamically add=
ing the q.

Not adding but enabling :)

For example, to be used for migration.

Thanks


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

