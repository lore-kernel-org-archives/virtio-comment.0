Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EEF15B0F6
	for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716964949; cv=none; b=dDGlu+6Fw4L8IRGdIGnGhvlgrd6mXn1m3H89TurBmxymp76VPlf9ym/VVzoJw9aCVPe7eC9a/zLW10CT7lwVKYinPnuKT7UFOcbUBZJbxars+rn+NKMlAMmtVXheDVnMWPomnjo9rUm2n8cYfrJTTRbLwjjjLa6E1hkdc2VvXfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716964949; c=relaxed/simple;
	bh=QjS7WvPJ/th3guXfV7FJF0Sn1bsmJ8UmaEX3Ew2lmkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WhqQVGvSVgYhaP0MZr4p6rFbRzK0twb3Y4RE18Y2lW1TtAAphDm5JssxtEGqQOejRV7TuI0mdEB0xBZ7F6QATVwAMoK+WBsFmwJ+DCTKv/U4QggS/cRnTtHvNCk1ZgvzcoET7wbifBNhYstt27XU/Cuf9rgDwjAY4Z5czwgY4ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=koljiuAI; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="koljiuAI"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35502a992c9so1782973f8f.3
        for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 23:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716964946; x=1717569746; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7drlgsCz3KIMlwPUSQKPUBdzwQA6qBula8T0tt7yxg=;
        b=koljiuAIHlAvxv4qaEV7ak9jrZDLe8tCGU/eYLkS6v1mJ5Nf0dYtQcZgsCWChDzPVb
         J8WU98EzPYKibIjTJXVPjjhs8wqAYITWFiRR/CBhX/T28TABl6MLmQlfDL4bbnfX3UT3
         WPz6k8uGj6xMiRgOyxPmSZB1P1Vep8iRnf6NNKVToJi9oXoZ2pPnn9fx3fyeyJsaGWKB
         M97cgNULIXv2y0YHC0ExK8q58RIcaB2OUve/GjZu+DO8BeNvGk9ObCXN87jJiH8CwVWd
         541DWWxqoaAwmSVucSvj58KeBQ3A7C67Yqlc5ZkOMSruXVXTo0ZnWlVz8h3kWRB6TRqJ
         wPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716964946; x=1717569746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7drlgsCz3KIMlwPUSQKPUBdzwQA6qBula8T0tt7yxg=;
        b=eeJtQtzCz/HNpVVpl1LfcorIxB0173TW75fnPv3xRY/EDPnI321i9LQbFB1yowSviD
         TrNQyiboBZ77Sxoj+Wj0LKtqnRKWQgeZ4fCxrOj6T9biZ3HP1JSrrLthIyMJ3ngQlLw0
         /4QqXo4pTgFPxNgOnibNLN61be1KVeNNgBnxhKpzG8TNUQ+zLji6VSUxioO7FTXJYIOz
         JYg2NKqbm2TtopkVJRBaHv5Boxs7hl93e0gu6jSgVHwU0Uzm1L+tTjlHBc7tmAFerAJ2
         NlpwtOp9rnPETh1tDxQ19uYQbZE7/HxjhwAVOGSlwU1wkY4sopy5qZGo/rs1GB7Ba6Si
         Dr4w==
X-Forwarded-Encrypted: i=1; AJvYcCWWwk0OjtUxBPXPCZjbD4FBQusJe6M18yvKZDf/mg5NXfxVyLFuYJtHMpKhM9mlVBnODdKF+Ur4+G1vkRXyqAy93AK5yUMn9bb+kmKVSuo=
X-Gm-Message-State: AOJu0YzgauJgExGVQ3DGTzDaYs4f1WYdot1LrDxnrLgfXcF+5TcNZ13T
	9B0dSb/9nBeB9nfcw/eA4exwc4QpBKgjHF745R3NDbCvb9IcMa72B8A41xiWlMEiIqIQX3k8XQU
	qE/ZZVe7rjLbSoRJNDu7k8kPObj8mR9RuGRJIBg==
X-Google-Smtp-Source: AGHT+IH/E0OhnTG/LdRytGI2FXKWJof4rdg97QBkERmRDXgco/aNndzAVczPfMINuzQAgfQRUSrPr1lJ2317L7P3FSw=
X-Received: by 2002:adf:f74d:0:b0:357:ff92:aada with SMTP id
 ffacd0b85a97d-357ff92aba5mr7231324f8f.13.1716964945687; Tue, 28 May 2024
 23:42:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zky6Disx1ofmETmn@fedora> <l2f7vf2nzrejy5rk7moymxgsrts3jh5pqcubctbzzmzzsoz4u4@4x63sz5u4ovg>
 <ZlSNR+2ysO9vMXhN@fedora> <5gcoinwkhq6n6vd5dtpypykp7gy5wzjyyjy4rfpgdeiwes2b23@i6zlcvat7yw7>
In-Reply-To: <5gcoinwkhq6n6vd5dtpypykp7gy5wzjyyjy4rfpgdeiwes2b23@i6zlcvat7yw7>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 29 May 2024 09:42:09 +0300
Message-ID: <CAAjaMXac=ewL78ceee4cafiiODgug0wXnbezRU6mkJ5C1cKteQ@mail.gmail.com>
Subject: Re: [PATCH Resend] virtio-snd: improve PCM command lifecycle description
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, virtio-comment@lists.linux.dev, 
	anton.yakovlev@opensynergy.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This sounds like it is unnecessarily overthought, semantically there's
only one command, "change state to" and it has a payload of "the new
desired state to transition to"

On Tue, 28 May 2024 at 18:13, Stefano Garzarella <sgarzare@redhat.com> wrot=
e:
>
> On Mon, May 27, 2024 at 03:40:23PM GMT, Matias Ezequiel Vara Larsen wrote=
:
> >On Thu, May 23, 2024 at 01:00:32PM +0200, Stefano Garzarella wrote:
> >> On Tue, May 21, 2024 at 05:13:18PM GMT, Matias Ezequiel Vara Larsen wr=
ote:
> >> > The PCM command lifecycle can be described as a state-machine in whi=
ch
> >> > the switching between states is triggered by commands. This commit
> >> > explicitly presents the different states and the commands that are
> >> > allowed in a given state. This commit leaves to the implementation t=
he
> >> > decision the state reached depending on the command.
> >> >
> >> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> >> > ---
> >> > device-types/sound/description.tex | 26 +++++++++++++++++++-------
> >> > 1 file changed, 19 insertions(+), 7 deletions(-)
> >> >
> >> > diff --git a/device-types/sound/description.tex b/device-types/sound=
/description.tex
> >> > index 54c9c8e..55e93af 100644
> >> > --- a/device-types/sound/description.tex
> >> > +++ b/device-types/sound/description.tex
> >> > @@ -397,9 +397,21 @@ \subsubsection{PCM Control Messages}\label{sec:=
Device Types / Sound Device / Dev
> >> > \item[\field{stream_id}] specifies a PCM stream identifier from 0 to=
 \field{streams} - 1.
> >> > \end{description}
> >> >
> >> > -\paragraph{PCM Command Lifecycle}
> >> > +\paragraph{PCM Command Lifecycle State Machine}
> >> >
> >> > -A PCM stream has the following command lifecycle:
> >> > +A PCM stream can be represented by a state-machine made up of the f=
ollowing
> >> > +states:
> >>
> >> I'm not clear about the difference between commands and states. Are th=
ey the
> >> same?
> >>
> >
> >AFAIU, a command is a request that comes into the control queue, such as
> >prepare, set_params, stop, start, etc. State refers to a stream's
> >current state.  A command triggers a transition over the stream's
> >states. There is a set of valid commands that are allowed in each state.
> >The specification does not make such a distinction. I wonder if this was
> >done on purpose by the authors.
>
> Okay, so there is a 1:1 overlap between commands and states. Basically,
> the =E2=80=9Cstop=E2=80=9D command has the action of moving the state fro=
m the current
> to the =E2=80=9Cstop=E2=80=9D state, right?
>
> >
> >> > +\begin{description}
> >> > +\item SET PARAMETERS
> >> > +\item PREPARE
> >> > +\item START
> >> > +\item STOP
> >> > +\item RELEASE
> >> > +\end{description}
> >> > +
> >> > +A command triggers the transition between these states. To what sta=
te to switch
> >> > +depends on the implementation. Depending on the state, only certain=
 commands
> >> > +are valid. An error may occur if an invalid command is triggered.
> >> >
> >>
> >> Should we explain what the following list is?
> >>
> >
> >I think we should. The list is the states and the commands that are
> >valid in a given state. The specification does not explain the state
> >that is taken when a command is triggered. I though leaving that for the
> >implementation.
> >
> >> > \begin{enumerate}
> >> > \item SET PARAMETERS
> >> > @@ -407,13 +419,13 @@ \subsubsection{PCM Control Messages}\label{sec=
:Device Types / Sound Device / Dev
> >> > The driver negotiates the stream parameters (format, transport, etc)=
 with
> >> > the device.
> >> >
> >> > -Possible valid transitions: set parameters, prepare.
> >> > +Possible valid commands: set parameters, prepare.
> >> >
> >
> >For example, in the SET_PARAMETERS state, there are two valid commands:
> >set parameters and prepare. Any other command in this state would be
> >invalid. If the frontend triggers the set_parameters command, the
> >backend may decide to either keep the stream state in SET_PARAMETERS or
> >switch to PREPARE.
> >
> >In the spec they use the wording `transition` and I think they mean the
> >valid next stream state. I changed this so now the spec specifies the
> >valid commands in a given state thus leaving for the implementation the
> >transition or the next state.

`Transition` is standard sequential logic terminology.
In a finite state machine you can just say that a state has next
states; they are not "valid", they are just the only ones existing.

What can be valid or not is the transition.


--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd
