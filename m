Return-Path: <virtio-comment-return-8753-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34CBC4167B
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 09:16:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F20EA2AD6E
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 09:16:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D653498682A
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 09:16:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BEF479866C0; Wed,  6 Dec 2023 09:16:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AFACB9866C1
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Dec 2023 09:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: MrfLiEwlMhSlVED5oUZLqw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701854176; x=1702458976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/jgyu43ajf8Q56cTwGa/391d6Q7ItrbTUZgCaKAq6k=;
        b=Jl8J3C3H9Hyck9OsZbyqge2yddPm3t0i0fd6kMATKoyUhg1Tp0cO6+OgKmdQG8kzhx
         oGwvvnbfzBQ4IIk4unfo2/a/Dfyar7nQ/5wACM0VxVKKjL4nt63pzc7lsz2oHluhjyMi
         UgGqowgOlahp9JGwB0khTIngvTaZUNMgBWzvqyqchlwJn8Ybo7xWnxLOExgm/HSuWDEJ
         Jm67LmpXo47FQtyOgwywE6H1t5FzeJ4IMw4ooZ/fiVBsn3HxPlkKhrGzUvlH8/q2MK8W
         n33SASVmu/iMtVniuatnqZvjs0mU+1qLDUHFPMfsQ5N4rh05ZxkGjrYKZpXGC+vzYgCm
         0gkQ==
X-Gm-Message-State: AOJu0Yz4fh0VKzu6jkr7iJaiiqW9cl5dWjg+TtF6Jx36F+RshjmpPFGf
	ih+Is87iW9J2jIf+E7i0o3IQuqLYtxiptGgOJdFHwhK4ohRJvIixApVmHO7CdS5FmHUQVF+wWtm
	AEZF7RTs1UqFB3cyiwrItIiM2Y1T0h7j2bIALHZ1+1MJ8VNs8Rw==
X-Received: by 2002:a05:6512:3a9:b0:50b:f4b0:84d4 with SMTP id v9-20020a05651203a900b0050bf4b084d4mr372379lfp.95.1701854176573;
        Wed, 06 Dec 2023 01:16:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtDNZWACAqqC4fZYBZP7urX0hrY5cAOciHnDtkf2iuoPPByQgJJe1J4jEvXx0NfWRMo4/oT5hELV9yRfgmeb0=
X-Received: by 2002:a05:6512:3a9:b0:50b:f4b0:84d4 with SMTP id
 v9-20020a05651203a900b0050bf4b084d4mr372368lfp.95.1701854176189; Wed, 06 Dec
 2023 01:16:16 -0800 (PST)
MIME-Version: 1.0
References: <20231204094123.856214-1-stevensd@chromium.org>
 <20231204094123.856214-2-stevensd@chromium.org> <CACGkMEuHLs=+8_RHVa9eTXfHLqo_Ra6hSrnT9k8DAG_0yz0pvQ@mail.gmail.com>
 <CAD=HUj6bBOOCWmrbxBHKymfAr3UVUL7S57FtffHi0vEzVmewDA@mail.gmail.com>
In-Reply-To: <CAD=HUj6bBOOCWmrbxBHKymfAr3UVUL7S57FtffHi0vEzVmewDA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 6 Dec 2023 17:16:04 +0800
Message-ID: <CACGkMEuGY9y5Zt9UdL+4V3tntnR4EyHHCRqX_P4QtmAOL0-Pew@mail.gmail.com>
To: David Stevens <stevensd@chromium.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, 
	virtio-dev@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v3 1/1] Define a low power mode for devices

On Tue, Dec 5, 2023 at 6:58=E2=80=AFPM David Stevens <stevensd@chromium.org=
> wrote:
>
> On Tue, Dec 5, 2023 at 1:18=E2=80=AFPM Jason Wang <jasowang@redhat.com> w=
rote:
> >
> > On Mon, Dec 4, 2023 at 5:41=E2=80=AFPM David Stevens <stevensd@chromium=
.org> wrote:
> > >
> > > Define a low power mode for virtio devices where the devices are
> > > expected to maintain their state. This gives drivers an option for po=
wer
> > > management besides simply resetting their device. In the virtualizati=
on
> > > use case, this allows the guest to be suspended even with stateful
> > > virtio devices like gpu and fs.
> > >
> > > Low power mode is primarily defined at the transport layer. The only
> > > part that depends on device-type specific details is whether a given
> > > virtqueue is device driven or driver driven.
> > >
> > > This change only defines the transport-specific implementation for
> > > Virtio over PCI.
> >
> > A dumb question, if this is only for PCI, can the device just
> > implement no_soft_reset via PMC?
>
> This is basically No_Soft_Reset, yes. If a change similar to [1] would
> be acceptable based only on the No_Soft_Reset bit even with no concept
> of power management in the virtio spec, then I personally don't have
> any problems with that.
>
> [1] https://lore.kernel.org/lkml/20231113055138.117392-1-stevensd@chromiu=
m.org/

So if I read the code correctly, the current Qemu advertises PM but
without no_soft_reset.

So this patch seems to break e.g virtio-net and doesn't fix virtio-GPU.

Thanks

>
> -David
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

