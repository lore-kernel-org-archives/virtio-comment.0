Return-Path: <virtio-comment-return-8215-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3DDC4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 15:18:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7FC0E2AEFF
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 15:18:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F27B9867B5
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 15:18:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 42FF998672B; Mon,  6 Nov 2023 15:18:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 32C7398672E
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 15:18:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: KIdJ79nUMfai0zK2pJgdag-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699283914; x=1699888714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUanjZZsy32CFqQmlle45mgmRhClCW/tNDasx5Dnigg=;
        b=aB8oFuInlvaGKIr8QqVThlT4CPJOvFb5lTc+bQxTNM123bfIg0VfULTipljde5PFaF
         sCDf6vZfwy6FJy3OxMasdybrHasAgNp+8wv2SJh1lE93miUFPjKNbHb8xlIq9/D5FBRw
         Ssv50qBTgl9QT1GYIrp8tCiWqwnVIRw7NiDp37mW9F4lIKM/quKlpaJ+38JDsSMTCsx9
         HC0ox/ZPoNWyFcFhfEwi8BcOoSyiJMGdinIPQOxRvr9VhPNnnSsj4AyXuEgs6+HA1UYF
         D0/2i9CviqM5ZR7Kbpm+HPzJniVz16VCoV9W+4zY9+bqAK4i1MoTKu1pLPu9kOYicml6
         CI+w==
X-Gm-Message-State: AOJu0Ywyo8ALlrIU9vvvAGcXSxrOMo5tZn2d6AjxEFJPHtwkG2YhAsoe
	wzu/2fmaEk4TaPapze09jbJjZtfUPMghqZAb056STxnYZIoafSbYkzLMuCv3SIKwQv/N4Pe+eN6
	A7YUSnD1VjitJia6G9ETdDo8MOlcmqxXZ0vjJsGyvcP0OEJ/XhA==
X-Received: by 2002:a67:c115:0:b0:45f:dd0:e1aa with SMTP id d21-20020a67c115000000b0045f0dd0e1aamr3940312vsj.31.1699283913375;
        Mon, 06 Nov 2023 07:18:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6mXxo8jvWylFOaOFq+qLxWTdag/r4aq6+b13LQ0y51GJ7sLpgFFuDHBaWapRMw/a5/7d0TxXSHI/1/58NCiU=
X-Received: by 2002:a67:c115:0:b0:45f:dd0:e1aa with SMTP id
 d21-20020a67c115000000b0045f0dd0e1aamr3940275vsj.31.1699283912813; Mon, 06
 Nov 2023 07:18:32 -0800 (PST)
MIME-Version: 1.0
References: <02725a6508584ed2aa8b31c9e9f4264a@blackberry.com>
 <ZTfHAQxns6j8gmEL@fedora> <134bb8dbb49643e6b3d6e9b65239b6a8@blackberry.com>
In-Reply-To: <134bb8dbb49643e6b3d6e9b65239b6a8@blackberry.com>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Mon, 6 Nov 2023 16:18:21 +0100
Message-ID: <CAHYGQ0whtt3pUK+dqrCFpRP4zJTV+6kXt4S3VG-WAM+ROV5N3w@mail.gmail.com>
To: Radu Ocica <rocica@blackberry.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"anton.yakovlev@opensynergy.com" <anton.yakovlev@opensynergy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [virtio-dev] virtio-snd comments/questions

On Fri, Nov 03, 2023 at 06:17:17PM +0000, Radu Ocica wrote:
> I also think that the driver should not send a STOP command after a faile=
d START command. There is no explicit description of any states in the virt=
io sound device specification. We have both adopted an interpretation that =
the state is determined by the last successful pcm control request and the =
transitions specified for pcm control requests assume success of these cont=
rol requests. I wish this was clarified explicitly in the spec, to not allo=
w room for interpretation.
>
>
I agree. I think what is missed in the spec is to define the behavior of
the PCM command cycle in case a command fails. I worked on a RFC to
improve that section, feel free to comment at
https://lists.oasis-open.org/archives/virtio-comment/202307/msg00158.html.
I think an overall solution would be to implement the PCM state machine
in the driver thus control messages would be sent only if the stream is
in the correct state.

Matias


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

