Return-Path: <virtio-comment-return-6803-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B8FEB64DC
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Jul 2023 03:56:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DB1EE2B043
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Jul 2023 03:56:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C4F3C98645C
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Jul 2023 03:56:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B80C998640A; Mon, 10 Jul 2023 03:56:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9891798640C
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Jul 2023 03:56:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 0nEI9xFFOsiSwnt1QtxdYA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688961362; x=1691553362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGbQW0JpfVqH/xOZEGlMmRoVV4VnHDvIJ/3QnLupQ3M=;
        b=WxkveQecINFj4k+lGc4JY+Vn68+Ob1JA1gZTJy8rPym5mCoajqWx3BpDOBmpp9WDFO
         06yAg8S9OOfo2L0a3uOCg4/f51MMVvlevj6rj2/tOykPeHwQRcpkKOsa+wtE3shszvsW
         7SONW76sEOW9g2T11xp5qSBoix1xvc5M6Z3A1CtbUP6DiNgrDiVs+lV9uWzJQlWBowEv
         iD+atFPRTAGG8K5bsEFs0UiBw7lbVhDs7eCA9f/DA3j2MkEUfbw4K0aHFfXUBsfSvGVn
         xTtPwa6FgVrq59DXp8TNS4HRmYl4jz+ZpPlfvziQBwna6bSDmedj1m6upDpEkDcdIP2z
         tCUw==
X-Gm-Message-State: ABy/qLZFhM1yWPHTlU3vmGtIkoqg5foC/n9OTBzbjInFi2lIrTcGKmAS
	8vBiyuAmnLJdqBlPyfkjA2iaFG8MfRx1CqXawFZ72nXYf0Mqq6VrwHheQGssevgMbUT6xb9+h4M
	6A4E2ylAujO+n3NmGDPnY6ihChsokdW9lIS626sEITnkW7G5PTw==
X-Received: by 2002:a2e:969a:0:b0:2b6:dcde:b77f with SMTP id q26-20020a2e969a000000b002b6dcdeb77fmr9227548lji.35.1688961362327;
        Sun, 09 Jul 2023 20:56:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEUeDCVN8JS7VvRdblGI34L7+n7qY9Di7heDq/5DQpupfvWycHFePh1HrKUS3aePHLb/46K/IpAlhunYs1tJU8=
X-Received: by 2002:a2e:969a:0:b0:2b6:dcde:b77f with SMTP id
 q26-20020a2e969a000000b002b6dcdeb77fmr9227522lji.35.1688961362053; Sun, 09
 Jul 2023 20:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230606175511.2337208-1-eperezma@redhat.com> <CAJaqyWe6nR_5bAfuqBfDJY8T-OPfHcjoYbXMyEQEEgL5Oko8WQ@mail.gmail.com>
In-Reply-To: <CAJaqyWe6nR_5bAfuqBfDJY8T-OPfHcjoYbXMyEQEEgL5Oko8WQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 10 Jul 2023 11:55:50 +0800
Message-ID: <CACGkMEub3RmrXfagZk9CH1t9r=-vaVu6anqEREqw4nphh9PxPQ@mail.gmail.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Laurent Vivier <lvivier@redhat.com>, 
	Cindy Lu <lulu@redhat.com>, cohuck@redhat.com, alvaro.karsz@solid-run.com, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
	Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com, 
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com, stefanha@redhat.com, 
	Harpreet Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Heng Qi <hengqi@linux.alibaba.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
	Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com, si-wei.liu@oracle.com, 
	mst@redhat.com, Yan Vugenfirer <yvugenfi@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH 0/2] Selective queue enabling

On Fri, Jul 7, 2023 at 2:19=E2=80=AFAM Eugenio Perez Martin <eperezma@redha=
t.com> wrote:
>
> On Tue, Jun 6, 2023 at 7:55=E2=80=AFPM Eugenio P=C3=A9rez <eperezma@redha=
t.com> wrote:
> >
> > This series allows the driver to start the device (as set DRIVER_OK) wi=
th only
> > some queues enabled, and then enable another queues later.
> >
> > This is the current way to migrate net device state through control
> > virtqueue, in a software assisted framework with vDPA:
> > * First, only net CVQ is enabled at DRIVER_OK
> > * All the control commands (mac address, mq, etc) needed for the device
> > to behave the same as the source of migration are sent
> > * Finally all the dataplane queues are enabled.
> >
>
> Adding Yan to the thread, who mentioned that he is looking for
> something similar in the virtio-networking upstream meeting.

Would there be a V2?

Thanks

>
> > Eugenio P=C3=A9rez (2):
> >   virtio: introduce selective queue enabling
> >   virtio: pci support virtqueue selective enabling
> >
> >  content.tex       | 15 +++++++++++++--
> >  transport-pci.tex |  4 ++++
> >  2 files changed, 17 insertions(+), 2 deletions(-)
> >
> > --
> > 2.31.1
> >
> >
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing=
-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> >
>


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

