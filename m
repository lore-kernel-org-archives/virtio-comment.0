Return-Path: <virtio-comment-return-5911-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CE6C77B75
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 15:58:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 08E0BF3EAB
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 15:58:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E68FC986512
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 15:58:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D54919864EE; Mon, 15 May 2023 15:58:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C3E88986509
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 May 2023 15:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684166334; x=1686758334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+lgDHpm8MZa2+93PbqS2gOPwgNHoi63PG79L9YSkGc=;
        b=O3SEUypfNMJKlnLcn1u6/d9VQBsUl2XI7o02UHKJb/F/65c80Lfid3vtxfg2Mpz7HV
         AhypjFIMh7p4KSI+0wO4rUDt0Y5p5gDSMJl6GsbtwhasUsHaQW0v5hezQwY+Y05oKNA8
         FgaLLGwKFc68zlvG3CNa6ybQV5zkgBDQvdU2uXHUsnKiNevxsEKD2MDmogoPkChjGo+S
         30SzFmjyYeO7wh4hE1X35Qudm5IJPqmlObeQI2Y+PXEb+VX+cFZNL/yKNShYqEnTpRtS
         gbv65OvgQ4HIAqXEKhylCwl+k2JrzAs0MDmnDuF7xE4du60aY5tYhc+IGPylGeeC4k6Y
         WFzg==
X-Gm-Message-State: AC+VfDwheoC0aUN34YBtNF94nKVSCLH+j+pRybMQaKs5SIQWHvJdWn4o
	3s0aKprwxQM07HhLxXr8qA0OFcvvBfc2ff6UomSGZg==
X-Google-Smtp-Source: ACHHUZ4nbZwU+A6eTlF0I9uKsCgAJvBlRpdaUeBN5KJJhq4d2ACdcxeDdrIuXF7p2omHSAhSWv9zQ9Jak8xmy9ytNg4=
X-Received: by 2002:adf:e4c7:0:b0:2f1:e162:d48 with SMTP id
 v7-20020adfe4c7000000b002f1e1620d48mr22573938wrm.47.1684166334005; Mon, 15
 May 2023 08:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <CABmGT5FVRj9=vrekhCOWwQnO2eOHDt8pA35hef+=BLN7fWi5=Q@mail.gmail.com>
 <877ct939qv.fsf@redhat.com> <CABmGT5EW_D7DWKM5WAGruyvyDiNv8R8_hGZXUvDc3itUZLeaQw@mail.gmail.com>
 <87y1lp1tta.fsf@redhat.com>
In-Reply-To: <87y1lp1tta.fsf@redhat.com>
From: "T.J. Alumbaugh" <talumbau@google.com>
Date: Mon, 15 May 2023 09:58:17 -0600
Message-ID: <CABmGT5E-=9-cEk2KHJG5h0fObhOopOUY1y5=kgDVO4kAGcHf2A@mail.gmail.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] trouble sending patch with git send-email

On Mon, May 15, 2023 at 9:46=E2=80=AFAM Cornelia Huck <cohuck@redhat.com> w=
rote:
>
>
> Presence of a cover letter or not should not make any difference whether
> the mailing list accepts your post (I'd probably add a cover letter only
> if the motivation section is too extensive for living in the git
> repository in the end; if it should be included, there is nothing wrong
> with a longer patch desription.)
>
> Maybe you can try to cc: me on your submission? Then I can see where
> things might have gone wrong. (Via the "--cc" option.)
>

Thanks for the help. I have cc'd you on my latest "git send-email" command.

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

