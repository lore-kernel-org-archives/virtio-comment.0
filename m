Return-Path: <virtio-comment-return-8241-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AF2C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:45:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7A8EF60D38
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:45:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7082B986B94
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:45:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6341B9867FB; Tue,  7 Nov 2023 10:45:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4C3699867FE
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 10:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: h7ib1PrqOrmDtyKyV3ucRw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699353869; x=1699958669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fOp+JUzkCDWMbv5he+G0bXu7PXhxQfqtP8pWoT+a6I=;
        b=VnLYHm9oJQ5QL+9145QwyeJmeRzMnUHvinkL6W7D55SRmqIbm4seBbOiKfbj2qgq0O
         Hed5VONwdC9x1nY+YWD0ip3amx+towgz7i2Vd/tEgoQY2Usj+sIXIAzr7vA/EJMyUoYr
         WdhGpcr4QAZuQvBJhbmNMYsvMtPTI3LlBqTKryMtS9dxqe5vtFOF6mYVKcFE/VvbiHsr
         i1PPBvoBcj+A9hIal2kYuJGNrnxc9Z2mr9qgswTue3nS8njn15hgVyeeG4v9mGBzuBTF
         sVkRlEwo0SCZRaZhocS2N9V0+Y/zsqhtEX8jEuytuIx00Ghr8oT7huCOG0Id+MpiZhZX
         94hg==
X-Gm-Message-State: AOJu0YyBzUAUmqDzqPL1lF920MIE8jQjud5gtkjXU9JPyq/JQMVthpYA
	F/tpH2V2HSTEHk5TdxA9PBPmPZuBOikpE34W+6+fo9laFabbfdYrhn7eEHegKuUQgXJrOB0Y18r
	NpJGSJChFqf4z6XznH4FUj3202+r8bLkYdXf1PLDDtsliXmeSN8gccdfXJw==
X-Received: by 2002:a05:6102:21cd:b0:45d:773b:f57b with SMTP id r13-20020a05610221cd00b0045d773bf57bmr937292vsg.17.1699353869185;
        Tue, 07 Nov 2023 02:44:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2/jPso9KrOi64VC1O60W6qNhKt19zrSKj3Jc/3EVQuPRfR++cl7SXu1iCutmTM2wxk3dspVTS5peHUE/XLEg=
X-Received: by 2002:a05:6102:21cd:b0:45d:773b:f57b with SMTP id
 r13-20020a05610221cd00b0045d773bf57bmr937290vsg.17.1699353868915; Tue, 07 Nov
 2023 02:44:28 -0800 (PST)
MIME-Version: 1.0
References: <e577462c42778eba4f3fc96cc08038fd6a2b4390.1689090186.git.mvaralar@redhat.com>
In-Reply-To: <e577462c42778eba4f3fc96cc08038fd6a2b4390.1689090186.git.mvaralar@redhat.com>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Tue, 7 Nov 2023 11:44:18 +0100
Message-ID: <CAHYGQ0wzMjCcWGJSSQiyc52eR3JKpBWOHgQ17Uv0Ffigf2kCkQ@mail.gmail.com>
To: virtio-comment@lists.oasis-open.org
Cc: anton.yakovlev@opensynergy.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [RFC PATCH] virtio-snd: improve PCM command lifecycle description

Ping Anton.

Matias

On Wed, Jul 12, 2023 at 10:37=E2=80=AFAM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> The PCM command lifecycle can be described as a state-machine in which
> the switching between states is triggered by commands. This commit
> explicitly presents the different states and the commands that are
> allowed in a given state. This commit leaves to the implementation the
> decision the state reached depending on the command.
>
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
>  device-types/sound/description.tex | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/device-types/sound/description.tex b/device-types/sound/desc=
ription.tex
> index 54c9c8e..55e93af 100644
> --- a/device-types/sound/description.tex
> +++ b/device-types/sound/description.tex
> @@ -397,9 +397,21 @@ \subsubsection{PCM Control Messages}\label{sec:Devic=
e Types / Sound Device / Dev
>  \item[\field{stream_id}] specifies a PCM stream identifier from 0 to \fi=
eld{streams} - 1.
>  \end{description}
>
> -\paragraph{PCM Command Lifecycle}
> +\paragraph{PCM Command Lifecycle State Machine}
>
> -A PCM stream has the following command lifecycle:
> +A PCM stream can be represented by a state-machine made up of the follow=
ing
> +states:
> +\begin{description}
> +\item SET PARAMETERS
> +\item PREPARE
> +\item START
> +\item STOP
> +\item RELEASE
> +\end{description}
> +
> +A command triggers the transition between these states. To what state to=
 switch
> +depends on the implementation. Depending on the state, only certain comm=
ands
> +are valid. An error may occur if an invalid command is triggered.
>
>  \begin{enumerate}
>  \item SET PARAMETERS
> @@ -407,13 +419,13 @@ \subsubsection{PCM Control Messages}\label{sec:Devi=
ce Types / Sound Device / Dev
>  The driver negotiates the stream parameters (format, transport, etc) wit=
h
>  the device.
>
> -Possible valid transitions: set parameters, prepare.
> +Possible valid commands: set parameters, prepare.
>
>  \item PREPARE
>
>  The device prepares the stream (allocates resources, etc).
>
> -Possible valid transitions: set parameters, prepare, start, release.
> +Possible valid commands: set parameters, prepare, start, release.
>
>  \item Output only: the driver transfers data for pre-buffing.
>
> @@ -421,7 +433,7 @@ \subsubsection{PCM Control Messages}\label{sec:Device=
 Types / Sound Device / Dev
>
>  The device starts the stream (unmute, putting into running state, etc).
>
> -Possible valid transitions: stop.
> +Possible valid commands: stop.
>
>  \item The driver transfers data to/from the stream.
>
> @@ -429,13 +441,13 @@ \subsubsection{PCM Control Messages}\label{sec:Devi=
ce Types / Sound Device / Dev
>
>  The device stops the stream (mute, putting into non-running state, etc).
>
> -Possible valid transitions: start, release.
> +Possible valid commands: start, release.
>
>  \item RELEASE
>
>  The device releases the stream (frees resources, etc).
>
> -Possible valid transitions: set parameters, prepare.
> +Possible valid commands: set parameters, prepare.
>
>  \end{enumerate}
>
> --
> 2.41.0
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

