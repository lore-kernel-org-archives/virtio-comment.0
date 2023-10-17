Return-Path: <virtio-comment-return-7760-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E3BCDB474
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 15:29:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 26F0377E8E
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 15:29:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F38BA986869
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 15:29:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D9C58986867; Tue, 17 Oct 2023 15:29:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA485986868
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 15:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697556585; x=1698161385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icVo8OYlNGHinMiG2OSQr5+QuLZHNWWjVJ6HQFa+TXk=;
        b=A3N2nYQhT++WjAdAAhgWPyeR7n/1Te4NXs5deXegcCbNlbYdDW7ltbWzGuqcDe3je+
         924E/N9KAVQh8VS1M0Csu9P2TDIVPhTIpW0nUhfdHYeHb1W2lCnTvJLldzP8OF/tRrlO
         UaJIW+Tihj4Ewkaucn5UQSbevXzcQrU2+qAeK3yHPyJPDmR8C2ItbIlS74uUcukmSSCT
         7GqAoGZQ5pgm4DxmsYApjjUxlEPL57MF4iwzpH5cDnlNWu7IWGWdueQVOjDwbvUODSN5
         1PQolSRS0bOS3GAJOta04IERZxMeUXZiGIDpML49lw9hojm0sfzUDprXYTXjYw91PIhN
         lWiQ==
X-Gm-Message-State: AOJu0YxHtmr42QgMUmMjDkH2/89UnKlukA+KBxTBIyppIBPGNVgYWXpr
	Sbws70r9AsFoKS2kXIgTlwepbIKlcfOWcp2BdUAm2g==
X-Google-Smtp-Source: AGHT+IErw2vtjAFzBfxr7XKHvKWn3p/TqHKuasrkFRDB0VRsq9iZwqZKi5kZoEyw5IHPgiUE9wHvjN5uiYVamYv7984=
X-Received: by 2002:a17:907:2d9e:b0:9c3:e66e:2002 with SMTP id
 gt30-20020a1709072d9e00b009c3e66e2002mr2030601ejc.6.1697556585115; Tue, 17
 Oct 2023 08:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <ZS6mA6/EsmvDVlTC@fedora>
In-Reply-To: <ZS6mA6/EsmvDVlTC@fedora>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 17 Oct 2023 18:29:28 +0300
Message-ID: <CAAjaMXYZ7u=jTfWLNRaRwOpsmuHXu62SGd03PTwxUupOybQJ8Q@mail.gmail.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtualization@lists.linux-foundation.org, 
	virtio-comment@lists.oasis-open.org, anton.yakovlev@opensynergy.com, 
	stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com, sgarzare@redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: [virtio-comment] Re: virtio-sound: release control request clarification

On Tue, 17 Oct 2023 at 18:19, Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> Hello,
>
> This email is to clarify the VirtIO specification regarding the RELEASE
> control request. Section 5.14.6.6.5.1 [1] states the following device
> requirements for the RELEASE control request:
> 1. The device MUST complete all pending I/O messages for the specified
> stream ID.
> 2. The device MUST NOT complete the control request while there are
> pending I/O messages for the specified stream ID.
>
> The 1) requirement does not indicate what "complete" means. Does it mean
> that the pending I/O messages in the tx queue shall be outputted in the
> host, i.e., consumed by the audio backend? Or, completion means simply
> to put the requests in the used-ring without consuming them?

It means the latter. At no point is the host's consumption of audio
data mentioned except for implicit or explicit period notifications.

>
> Regarding 2), I interpret it as "the device shall wait until all I/O
> messages are proceeded to complete the RELEASE control request".

Possible state transitions to RELEASE state are from PREPARE and STOP,
which neither are associated with active I/O in the streams.
The correct interpretation is "Do not reply to the control request if
you have pending I/O messages for this stream ID".

> Currently, the kernel driver seems not expecting such a delay when the
> RELEASE command is sent. If I understand correctly, the kernel driver
> first sends the RELEASE command and waits a fixed amount of time until
> the device can process it. Then, the driver waits a fixed amount of time
> until all pending IO messages are completed. If the device follows the
> specification and waits until all messages IO are completed to issue the
> completion of the RELEASE command, the kernel driver may timeout. The
> time to complete N IO messages in the TX queue could be proportional
> with the number of pending messages.
>
> In our device implementation [2], RELEASE is handled as follows:
> - Drop all messages in the TX queue without outputting in the host.
> - Complete the RELEASE control request.
>
> This seems to be working, however, I can observe that sometimes there
> are still requests in the TX queue when we get RELEASE. Those requests
> are never reproduced in the host.

My guess is this is because of the guest alsa doing prebuffering, not
that the host is supposed to handle those I/O messages.

--
Manos

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

