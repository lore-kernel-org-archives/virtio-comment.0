Return-Path: <virtio-comment-return-5260-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D005C76188
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 12:52:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CA99C370F2
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 12:52:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B37F79865C3
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 12:52:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A8F749865A7; Wed,  5 Apr 2023 12:52:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9827B9865A8
	for <virtio-comment@lists.oasis-open.org>; Wed,  5 Apr 2023 12:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: dVfvtabhOYWDAS_RLnDo5Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680699140;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ER5/T48KaGKbPd14Tf1A9Q0oSVV8kNVM0YABBYaQnk=;
        b=5YDDl5Wb0p1crscZ/f1OH32enzV5reNeuJDqt7OiV9qrdC4JKKEA9TXMUTGGXX5ebd
         tjNq3T0X+P6Z1l1QLj7NB7KqwhMbbiibCQ22hS6KiJ6HiL3XwwvmU2gvYWU0LGHK7Zgd
         HS2iqwOaQiXo3ld0lI4su7REoqFVmbm4xCicojqKirecjbxrINLEEc3dHH40Q7Kr7u/t
         1wmk6CIQRS8Bc8SK5Qi38MH14039L5VTCJudpHPo63v6vw31BDfSdLI99ynjpNrUQho5
         Ltq5JUMXi1C+3mCf70ELQHHZ+uua6fwD7yPSIeatSS0QnS1RVxb6mXJ9k9p5V92tyj7f
         ViRA==
X-Gm-Message-State: AAQBX9fnK6F8SggS1EpzfLsCW9UrNfnzyFc1z3SVyKV2/zGC0bROVp70
	+DpFqb/LJhF7T5h4/BY1KJuhP0q4t3u+LD34NWZKH4PcLuVM03Sv9EI2ycwKMyWhtgkm5UuQ6aB
	V7P4tQyYYbyML8KKFVRw+C3R8wyEWqILqVA==
X-Received: by 2002:aa7:c68b:0:b0:502:30e6:1e47 with SMTP id n11-20020aa7c68b000000b0050230e61e47mr1779688edq.13.1680699140606;
        Wed, 05 Apr 2023 05:52:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZXZAV73B+FztT5bz8v/wkJQTVX/2/QlZ2ac8DTTOCO8QwDORR31O79ToeiR4DBDc9bfaqa0g==
X-Received: by 2002:aa7:c68b:0:b0:502:30e6:1e47 with SMTP id n11-20020aa7c68b000000b0050230e61e47mr1779668edq.13.1680699140314;
        Wed, 05 Apr 2023 05:52:20 -0700 (PDT)
Date: Wed, 5 Apr 2023 08:52:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexandra Winter <wintera@linux.ibm.com>
Cc: Wen Gu <guwen@linux.alibaba.com>, Halil Pasic <pasic@linux.ibm.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtio-comment@lists.oasis-open.org, hans@linux.alibaba.com,
	herongguang@linux.alibaba.com, zmlcc@linux.alibaba.com,
	dust.li@linux.alibaba.com, tonylu@linux.alibaba.com,
	zhenzao@linux.alibaba.com, helinguo@linux.alibaba.com,
	gerry@linux.alibaba.com, cohuck@redhat.com, jasowang@redhat.com,
	Jan Kiszka <jan.kiszka@siemens.com>, kgraul@linux.ibm.com,
	wenjia@linux.ibm.com, jaka@linux.ibm.com, hca@linux.ibm.com,
	twinkler@linux.ibm.com, raspl@linux.ibm.com,
	virtio-dev@lists.oasis-open.org
Message-ID: <20230405084632-mutt-send-email-mst@kernel.org>
References: <20230209033056.96657-1-xuanzhuo@linux.alibaba.com>
 <20230209033056.96657-2-xuanzhuo@linux.alibaba.com>
 <20230323154656.7f036d52.pasic@linux.ibm.com>
 <ff9b28a1-e0ee-f082-1f40-f3e149c9403e@linux.alibaba.com>
 <7a9ebec0-5e87-b80f-4f2c-c4db7ae4fe84@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <7a9ebec0-5e87-b80f-4f2c-c4db7ae4fe84@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment] [PATCH v3 1/1] virtio-ism:
 introduce new device virtio-ism

On Wed, Apr 05, 2023 at 02:39:53PM +0200, Alexandra Winter wrote:
> 
> 
> On 24.03.23 05:03, Wen Gu wrote:
> > 
> > 
> > On 2023/3/23 22:46, Halil Pasic wrote:
> > 
> >> On Thu,  9 Feb 2023 11:30:56 +0800
> >> Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> >>
> 
> ...
> 
> > 
> >> To get back to the things proposed here: the cdid is IMHO
> >> a nice thing, and is functionally corresponding to the
> >> (S)EID. But it is 16 byte wide, and I have no idea how
> >> is it supposed to be used in the CLC handshake.
> >>
> > 
> > CLC handshake carry one SEID for all the SMC-D device. Considering
> > coexistence with ISM, I am not sure whether we can change or increase
> > the SEID.. cc Alexandra
> > 
> > Thanks!
> > Wen Gu
> 
> As mentioned by others, discussions are ongoing.
> It would be great, if we can agree on a way to use the existing CLC handshake
> for SMC-D via virtio-ism and ism-loopback.
> In that case SEID needs to be unique per hardware instance, cannot be increased and
> can only be changed for x86 in a non-colliding way.
> 
> An alternative would be to define new a SMC-D(?) protocol variant/version, where we
> are free to define new fields (e.g. UUIDs).
> 
> Alexandra

Problem with tying to hardware is that it is blocking
migration (which is a challenge with ism anyway, but still).


> > 
> >> If this is really supposed to work with SMC and not just take
> >> inspiration from it, I would like some insight from our
> >> SMC experts (they are already on copy).
> >>
> >> Regards,
> >> Halil
> >>
> >> ---------------------------------------------------------------------
> >> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> >> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org


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

