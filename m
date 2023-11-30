Return-Path: <virtio-comment-return-8689-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D52C4167B
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 08:13:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D929315706B
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 08:13:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AEE5B98668D
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 08:13:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8456898666D; Thu, 30 Nov 2023 08:13:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 741F6986670
	for <virtio-comment@lists.oasis-open.org>; Thu, 30 Nov 2023 08:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701332016; x=1701936816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AG5Q+TCbAkl1FEbOvEY0fT9oAGdK9DeMxicjiCd+I0Q=;
        b=pgTa+Gzdl+RdLxbUGJeOQXhr7QmeVs0/S9WkPfoVKTz2Q+xFmKI1tjx4rNu006I/JM
         6sI/jj0amE1lfQKzt8n3w1p7FMlr3G7ImmMNwQ2+wOEgfuVn2+g9QLZ+TLrA5zLJhSrW
         6URUgTanFuAirqeShxfy02i3xkOQ3B/V4YcYbhh835CLJwIbZWfa01ykzWCeIFc1WUAL
         f2q36sg0hzCkVkI+lWBuExb+I2WqspxeLEYIei1n6qk2/FhuD1dXjpbDL+qK6Emd5yKA
         3YTjpbH1z6KG3Gtl61NP34LnSsHXPazEqeN1RXFGrLpCs2huvjhU0bTx4ehdJL2nFf/K
         iygg==
X-Gm-Message-State: AOJu0YzycMRTuWTyLAo5/TfMI7NrZQzHMLeHMezTe7QuQwOOhMDNje/D
	dfSY0jSFaQvGqWCDPZBITAraZu7bsefvAZmPM8n7pg==
X-Google-Smtp-Source: AGHT+IFa8I6c15SPUDs6HlTS2VWJv2XHIAjpK8g8dWwcpL2gfc/h7lZ7Y1rI+5JSSnGH7f2nZbPFhaHzVuIVuaS+peY=
X-Received: by 2002:a05:6512:2314:b0:50b:a823:8422 with SMTP id
 o20-20020a056512231400b0050ba8238422mr14044722lfu.47.1701332016382; Thu, 30
 Nov 2023 00:13:36 -0800 (PST)
MIME-Version: 1.0
References: <20231113061950.122683-1-stevensd@chromium.org>
In-Reply-To: <20231113061950.122683-1-stevensd@chromium.org>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 30 Nov 2023 17:13:25 +0900
Message-ID: <CAD=HUj7O2HaJQUAmpOVm6P9nwdx8y4rnOTJD4wLKYkFZE5zTog@mail.gmail.com>
To: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v2 0/1] Define low power mode for devices

On Mon, Nov 13, 2023 at 3:20=E2=80=AFPM David Stevens <stevensd@chromium.or=
g> wrote:
>
> The virtio spec currently does not include the concept of device power
> management. The lack means that there is no good action drivers can take
> when they are requested to put the device into a low power state (e.g.
> when a guest is entering a system-wide low power state like S0ix/S3).
> Stateless devices can be handled - albeit inefficiently - by resetting
> and reinitialzing the device. However, stateful devices cannot support
> this situation. This patch defines a low power mode for devices that can
> be used in this situation.
>
> Low power mode is mostly defined at the transport layer, and all
> device-side power optimizations are optional. This avoids the need for
> invasive device-by-device definitions. It also pushes the requirement
> onto the device side, to simplify what driver side changes are
> necessary to just [1].
>
> I believe this patch may address the virtio-gpu issue which [2] is
> trying to address by avoiding the reset altogether when the guest enters
> S3.
>
> [1] https://lore.kernel.org/lkml/20231113055138.117392-1-stevensd@chromiu=
m.org/
> [2] https://lore.kernel.org/lkml/20230919114242.2283646-1-Jiqian.Chen@amd=
.com/
>
> v1 -> v2:
>  - Define virtio-pci support on top of PCI power management.
>  - Add more conformance requirements.

Friendly ping, and directly CC'ing reviewers.

-David

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

