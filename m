Return-Path: <virtio-comment-return-8731-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEF8C4167B
	for <virtio-comment@archiver.kernel.org>; Tue,  5 Dec 2023 04:18:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F41BB335BC
	for <virtio-comment@archiver.kernel.org>; Tue,  5 Dec 2023 04:18:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C3C1498655E
	for <virtio-comment@archiver.kernel.org>; Tue,  5 Dec 2023 04:18:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A247B986455; Tue,  5 Dec 2023 04:18:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7D55A98645D
	for <virtio-comment@lists.oasis-open.org>; Tue,  5 Dec 2023 04:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Paq3sLQUOVCYi1fwr_kSKg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701749892; x=1702354692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7ljIY5PP2Bzhx16heL8WvwkVpNwM5kZAhu+t4uz6q8=;
        b=eH8Ku8+1KTjtWncEkkGsLLb546+4V2wr4ZC2e/9P38uB2AxaRa/cvY+W7Nn4qpc4Jb
         IP+3/CaGRi4r8ixzrWGjOYIdFfc78DUnB2EeDlLVQJNXIgd55cdEKlgtGt+rG6PVWDw+
         k9kNFiTNbuEnlzf73IATHJsDI0iBPGoUhpJvkXNrlcIRiVZFNcHjsMG0AV4H5xO4/tau
         yNgYGH7iXuu3WgjC5b88hpd3GQk15/Zn8OmUGuKy3wI5a5odY2jAzkmx8U8hRQfRX3Xe
         d5Q+KMnUbwBlpmtgmtVSiHrtWEiI53RjpSsq4DmxroCogzrrjXbuu/H3AbE+zMpU3iTu
         K35w==
X-Gm-Message-State: AOJu0YyjlPkQHJpb89TIzffgChoK4QkJiYRp96neHImkG+LCJvTGIwJm
	jjxQYqTAJIActHqb3Bbn4Jk0drvhr6UsX4pmGzcIsCZMhmCZijaQ3dLNz4iTcwrk0OcPklW5vdu
	un1XJcFFe3g3syVSxZH9xw0JWwaT82gYmFFT+6AxT3vxWdZBVqA==
X-Received: by 2002:ac2:5610:0:b0:50b:fb38:f7bf with SMTP id v16-20020ac25610000000b0050bfb38f7bfmr849605lfd.69.1701749892718;
        Mon, 04 Dec 2023 20:18:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrWr/mEvS853L1k68Rk7MRPiuZj0hyFJFUfWF1odN2Ec2R08Q/psFA8bw1hzP4EgcqVAnoluA9g2vGsP6pCRM=
X-Received: by 2002:ac2:5610:0:b0:50b:fb38:f7bf with SMTP id
 v16-20020ac25610000000b0050bfb38f7bfmr849602lfd.69.1701749892335; Mon, 04 Dec
 2023 20:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20231204094123.856214-1-stevensd@chromium.org> <20231204094123.856214-2-stevensd@chromium.org>
In-Reply-To: <20231204094123.856214-2-stevensd@chromium.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 5 Dec 2023 12:18:01 +0800
Message-ID: <CACGkMEuHLs=+8_RHVa9eTXfHLqo_Ra6hSrnT9k8DAG_0yz0pvQ@mail.gmail.com>
To: David Stevens <stevensd@chromium.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, 
	virtio-dev@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v3 1/1] Define a low power mode for devices

On Mon, Dec 4, 2023 at 5:41=E2=80=AFPM David Stevens <stevensd@chromium.org=
> wrote:
>
> Define a low power mode for virtio devices where the devices are
> expected to maintain their state. This gives drivers an option for power
> management besides simply resetting their device. In the virtualization
> use case, this allows the guest to be suspended even with stateful
> virtio devices like gpu and fs.
>
> Low power mode is primarily defined at the transport layer. The only
> part that depends on device-type specific details is whether a given
> virtqueue is device driven or driver driven.
>
> This change only defines the transport-specific implementation for
> Virtio over PCI.

A dumb question, if this is only for PCI, can the device just
implement no_soft_reset via PMC?

Thanks


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

