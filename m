Return-Path: <virtio-comment-return-5306-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F510C6FD1D
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:16:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8AF8342565
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:16:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7629E9865DB
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:16:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6A233983F7B; Fri,  7 Apr 2023 11:16:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 597669865D7
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Apr 2023 11:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: V0nBb1a0OxaZz2zqYvFZDg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680866164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PfG0hcmT2i3RCcKAk80AkcM6F5NH3SssWKON8oN81Js=;
        b=hihHzbiwmLYDsEsNAC9FXWDF8jhk28578oWM/IpzBdltXvBnrbWW/uBFuU6WGV4Te6
         vxrS/gTuzeLnR6P7WSXrpyz4OZ2mg1SFX/kwqSUURmkqxmP1tEyWPCKb7uJozk3qSFsd
         UXgyUq6WIOK4uNjpnqD5cgSE2Bwp7cdJgz1KMYpyftyzTGsT1eWhO/Y2E4M6OVp2Wn+H
         OsyP0KqNIqsHZ2fjRBxOv30+y9YM744XctFt4hjva/dDEGdosX57zdFvDcRBdAdu2l0p
         9iR+pZ5/nB2zm9eQlpEUPCWeW1jjPdFQ2TIl4nYSroslFxjFLSbTtlAmUpA1z2g25Mrg
         lAyg==
X-Gm-Message-State: AAQBX9fKLleVKiLcet40Qd0CYrqNKB58qy7zwN9E4SaXC6b8AHK4Ka4V
	3ZWjHm5L1lqnNdqjInP7trGEebYeokDbN4vom+QOsLDiA7tOwiQpKXfqru4GZ9hkBsZqMEIb2oV
	uULJtFE+nkbwhq79Q9cuXPTy6UWuc9+lcSw==
X-Received: by 2002:a5d:6a44:0:b0:2ef:6c47:c4be with SMTP id t4-20020a5d6a44000000b002ef6c47c4bemr1083242wrw.29.1680866164013;
        Fri, 07 Apr 2023 04:16:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350YxRL0PVpmiV4k6gzOoA4fOkpD3Lm6h/n6guF/wHh6nbE31OKWT5ORiaDWAf9NKuwNItTDN5g==
X-Received: by 2002:a5d:6a44:0:b0:2ef:6c47:c4be with SMTP id t4-20020a5d6a44000000b002ef6c47c4bemr1083236wrw.29.1680866163738;
        Fri, 07 Apr 2023 04:16:03 -0700 (PDT)
Date: Fri, 7 Apr 2023 07:16:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Alexandra Winter <wintera@linux.ibm.com>,
	virtio-comment@lists.oasis-open.org
Message-ID: <20230407071407-mutt-send-email-mst@kernel.org>
References: <20230209033056.96657-1-xuanzhuo@linux.alibaba.com>
 <20230209033056.96657-2-xuanzhuo@linux.alibaba.com>
 <20230323154656.7f036d52.pasic@linux.ibm.com>
 <ff9b28a1-e0ee-f082-1f40-f3e149c9403e@linux.alibaba.com>
 <7a9ebec0-5e87-b80f-4f2c-c4db7ae4fe84@linux.ibm.com>
 <20230405084632-mutt-send-email-mst@kernel.org>
 <ad19f1a6-bdcd-1e4d-1450-7292c8e4d1d4@linux.ibm.com>
 <64f7af4c-560c-ed53-fc3f-4b5ef1bc27b5@linux.ibm.com>
 <1680837925.8940198-3-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1680837925.8940198-3-xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: Fwd: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment]
 [PATCH v3 1/1] virtio-ism: introduce new device virtio-ism

On Fri, Apr 07, 2023 at 11:25:25AM +0800, Xuan Zhuo wrote:
> On Wed, 5 Apr 2023 15:06:38 +0200, Alexandra Winter <wintera@linux.ibm.com> wrote:
> > Forwarding to virtio-comment@lists.oasis-open.org for completeness
> > as I cannot post to virtio-dev@lists.oasis-open.org
> >
> >
> > -------- Forwarded Message --------
> > Subject: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment] [PATCH v3 1/1] virtio-ism: introduce new device virtio-ism
> > Date: Wed, 5 Apr 2023 15:02:57 +0200
> > From: Alexandra Winter <wintera@linux.ibm.com>
> > To: Michael S. Tsirkin <mst@redhat.com>
> > CC: Wen Gu <guwen@linux.alibaba.com>, Halil Pasic <pasic@linux.ibm.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtio-comment@lists.oasis-open.org, hans@linux.alibaba.com, herongguang@linux.alibaba.com, zmlcc@linux.alibaba.com, dust.li@linux.alibaba.com, tonylu@linux.alibaba.com, zhenzao@linux.alibaba.com, helinguo@linux.alibaba.com, gerry@linux.alibaba.com, cohuck@redhat.com, jasowang@redhat.com, Jan Kiszka <jan.kiszka@siemens.com>, kgraul@linux.ibm.com, wenjia@linux.ibm.com, jaka@linux.ibm.com, hca@linux.ibm.com, twinkler@linux.ibm.com, raspl@linux.ibm.com, virtio-dev@lists.oasis-open.org
> >
> >
> >
> > On 05.04.23 14:52, Michael S. Tsirkin wrote:
> > > On Wed, Apr 05, 2023 at 02:39:53PM +0200, Alexandra Winter wrote:
> > >>
> > >>
> > >> On 24.03.23 05:03, Wen Gu wrote:
> > >>>
> > >>>
> > >>> On 2023/3/23 22:46, Halil Pasic wrote:
> > >>>
> > >>>> On Thu,  9 Feb 2023 11:30:56 +0800
> > >>>> Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > >>>>
> > >>
> > >> ...
> > >>
> > >>>
> > >>>> To get back to the things proposed here: the cdid is IMHO
> > >>>> a nice thing, and is functionally corresponding to the
> > >>>> (S)EID. But it is 16 byte wide, and I have no idea how
> > >>>> is it supposed to be used in the CLC handshake.
> > >>>>
> > >>>
> > >>> CLC handshake carry one SEID for all the SMC-D device. Considering
> > >>> coexistence with ISM, I am not sure whether we can change or increase
> > >>> the SEID.. cc Alexandra
> > >>>
> > >>> Thanks!
> > >>> Wen Gu
> > >>
> > >> As mentioned by others, discussions are ongoing.
> > >> It would be great, if we can agree on a way to use the existing CLC handshake
> > >> for SMC-D via virtio-ism and ism-loopback.
> > >> In that case SEID needs to be unique per hardware instance, cannot be increased and
> > >> can only be changed for x86 in a non-colliding way.
> > >>
> > >> An alternative would be to define new a SMC-D(?) protocol variant/version, where we
> > >> are free to define new fields (e.g. UUIDs).
> > >>
> > >> Alexandra
> > >
> > > Problem with tying to hardware is that it is blocking
> > > migration (which is a challenge with ism anyway, but still).
> >
> > Very true. My assumption is that _Internal_ Shared Memory
> > is limited to one instance of HW (as it is today).
> > So the 2 partners need to be on the same instance of HW.
> > So after migration of 1 partner, they should be able to detect
> > that internal SMC-D is no longer possible and switch to
> > SMC-R (remote) for the next connection.
> > (I have no idea how a connection could survive migration)
> 
> 
> I agree.
> 
> In terms of structure, there is no way to support migration. We can indeed
> provide some means to perceive the occurrence of migration to the upper
> users. Finally, the user (such as SMC) decides how to do it by itself.
> 
> Thanks.

I am not asking that this support be immediately included now.
We were discussing IDs, and experience shows it is a good idea
to support software-generated ones. Migration is one use-case
there could be others.


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

