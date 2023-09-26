Return-Path: <virtio-comment-return-7543-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3915DEE3F2A
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Sep 2023 06:44:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9B13C33095
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Sep 2023 06:44:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7C4F69866B6
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Sep 2023 06:44:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6AF4B98644F; Tue, 26 Sep 2023 06:44:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 56AE39863A6
	for <virtio-comment@lists.oasis-open.org>; Tue, 26 Sep 2023 06:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695710668; x=1696315468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EuN6SIaIKQkrXqkuAtnD10zrgpzgl7JTDsK2ngMSMhw=;
        b=a6sH7+zAgQH3jVt5zhkk3CBjBa1KFOL3N264jISrgACqVEMLROF9cSZv/toGun6yLf
         rzePZ6ZrVoQNYGPDsV2+JvtWD18VARTl/V9K9BZXQboZgyv6yrXmLLtlKKPCKG30GsGb
         p5PNhPzuZKiuXOYFKmF+T2rwn4da3XQ7RI4wwH0O7Xde2k3LPGMhRMnyIQU1+UmPJguT
         eZEMFp+02TN/Zrb6VkZDcuRXjtWrxjLUcR1WrKPEVZYUNhjpw5pP4YzSDx/Yz7M4yFyn
         +fpGXWghu4UVESHcas4XDCFrCbTSCJw7ITGeq4grwGukmKd0W/tmXSyVMbTKi9kvaNXf
         Qowg==
X-Gm-Message-State: AOJu0Ywffbo44+2rrNbdDm33elPyNHYOQh49+9D16a60NjCoHOG76cuz
	CFL2pNGwZsi0+i0eLmfQeZNaknWb+2YpD0jejojpvg==
X-Google-Smtp-Source: AGHT+IHPM5dL2I+3RrAvnTyTCMtjITEObJsJRtuKSbU+iCHZskh2uVTTYbMcHUvzsvMk4XHMoq7HvFFOstseIEbP6BE=
X-Received: by 2002:a05:6102:134f:b0:450:f9eb:f412 with SMTP id
 j15-20020a056102134f00b00450f9ebf412mr6680903vsl.5.1695710668548; Mon, 25 Sep
 2023 23:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <80a2e4337affb043909c348395fb45aeeb693dc7.1695640593.git.JESHWANTHKUMAR.NK@amd.com>
 <904049f9-3ddf-7e88-c6f3-785a29a08210@linaro.org> <CAHUa44GzHPkntr=sFYYzokW0=9CCN7n6Ch1i6J7L7Uhh5U5P3A@mail.gmail.com>
In-Reply-To: <CAHUa44GzHPkntr=sFYYzokW0=9CCN7n6Ch1i6J7L7Uhh5U5P3A@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 26 Sep 2023 08:44:17 +0200
Message-ID: <CAFA6WYOsPhFkyrG0P7B6Ec=AnDvoUaerLocM89KtmybLmKbsaw@mail.gmail.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: jeshwanthkumar.nk@amd.com, Devaraj.Rangasamy@amd.com, 
	Mythri.Pandeshwarakrishna@amd.com, Nimesh.Easow@amd.com, 
	Rijo-john.Thomas@amd.com, babulu.ellune@amd.com, 
	virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org, 
	Arnd Bergmann <arnd.bergmann@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [virtio-dev] [PATCH v2] virtio-tee: Reserve device ID 46 for TEE device

+cc Alex

On Tue, 26 Sept 2023 at 08:16, Jens Wiklander <jens.wiklander@linaro.org> w=
rote:
>
> Hi,
>
> [+cc Arnd]
>
> On Tue, Sep 26, 2023 at 8:00=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org=
> wrote:
> >
> > +cc Jens
> >
> > > In a virtual environment, an application running in guest VM may want
> > > to delegate security sensitive tasks to a Trusted Application (TA)
> > > running within a Trusted Execution Environment (TEE). A TEE is a trus=
ted
> > > OS running in some secure environment, for example, TrustZone on ARM
> > > CPUs, or a separate secure co-processor etc.
> >
> > I have been exploring this area quite recently with an effort to have a=
 common VIRIO interface which can support different trusted OS implementati=
ons. I guess you intend to test it with AMD-TEE, right? Any plans to test i=
t with OP-TEE? As currently we have these two supported upstream.
> >
> > Do you currently have any virtio frontend/backend implementations for t=
his?
> >
> > >
> > > A virtual TEE device emulates a TEE within a guest VM. Such a virtual
> > > TEE device supports multiple operations such as:
> > >
> > > VIRTIO_TEE_CMD_OPEN_DEVICE =E2=80=93 Open a communication channel wit=
h virtio
> > >                              TEE device.
> > > VIRTIO_TEE_CMD_CLOSE_DEVICE =E2=80=93 Close communication channel wit=
h virtio
> > >                               TEE device.
> > > VIRTIO_TEE_CMD_GET_VERSION =E2=80=93 Get version of virtio TEE.
> > > VIRTIO_TEE_CMD_OPEN_SESSION =E2=80=93 Open a session to communicate w=
ith
> > >                               trusted application running in TEE.
> > > VIRTIO_TEE_CMD_CLOSE_SESSION =E2=80=93 Close a session to end communi=
cation
> > >                                with trusted application running in TE=
E.
> > > VIRTIO_TEE_CMD_INVOKE_FUNC =E2=80=93 Invoke a command or function in =
trusted
> > >                              application running in TEE.
> > > VIRTIO_TEE_CMD_CANCEL_REQ =E2=80=93 Cancel an ongoing command within =
TEE.
> > >
> >
> > How about shared memory support? We would like to register guest pages =
with the trusted OS.
>
> Coincidently Arnd and I (among others) discussed this in person last
> week and the conclusion was that only temporary shared memory is
> possible with virtio. So the shared memory has to be set up and torn
> down by the host during each operation, typically open-session or
> invoke-func.

Agree as I was part of those discussions. But I would like to
understand the reasoning behind it. Is there any restriction by VIRTIO
specification that we can't register guest page PAs to a device (TEE
in our case) to allow for zero copy transfers?

Alex mentioned some references to virtio GPU device. I suppose I need
to dive into its implementation to see if there are any similarities
to our use-case.

> That might not be optimal if trying to maximize
> performance, but it is portable.

IMO, the ABI should be flexible enough to support a TEE with optimum
performance.

-Sumit

>
> Cheers,
> Jens
>
> >
> > -Sumit
> >
> > > We would like to reserve device ID 46 for Virtio-TEE device.
> > >
> > > Signed-off-by: Jeshwanth Kumar <jeshwanthkumar.nk@amd.com>
> > > ---
> > >  content.tex | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/content.tex b/content.tex
> > > index 0a62dce..644aa4a 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
> > >  \hline
> > >  45         &   SPI master \\
> > >  \hline
> > > +46         &   TEE device \\
> > > +\hline
> > > \end{tabular}
> > >
> > >  Some of the devices above are unspecified by this document,

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

