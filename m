Return-Path: <virtio-comment-return-7759-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F04DCDB482
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 15:20:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D137A77864
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 15:20:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C7B8F98686F
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 15:20:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BCEDA986866; Tue, 17 Oct 2023 15:20:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE7AE986867
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 15:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: v1XfJMaCNVG-ikzVL_o8Kw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697555975; x=1698160775;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hEljbdfa7bD86OhYFUOYvSGcltkQSYot0oEUAqeyQEA=;
        b=USMI1cSNjgFFyJrQ9y2D+D46IWjIEwqsUVV91iuF3TP1rH6euwVcBN1LXecyGaLmhx
         rjVDGrtz6wdO76sf2japG4xRfvseFxL/WGkaDGvAZDHqmNrPdKKwf36WLaDsqkRzA5ar
         2QMzAQx8lWlPbGpJVgM0yiGHbnIt7+5lW1MczuwJPvj60apOHTrPvs6pdiIIaqLvTgL4
         wzGzeeCRlXeA1azReH6CTnq5Bzg4ghD2VXz7I0AWSMzVk44p6q5gmzQjkq2zrhxfc34d
         fbpzRGm0LFJmknCTEVKt+stZbtVSyl9N62M8r25hVBp9Arm8AoIqlUU+NXpdk6dlMCSg
         L4uA==
X-Gm-Message-State: AOJu0YxgYmYRYEy3/Zn1t3dMVyZP3X+X0UuvWbZjYyFYov4aAkllBEIu
	Nbt5Q3y2mCDa8CGVooPnTrnZ1HlfnFGNwHczuawT+H6mRyDEGotQwUxeNqcrazBgPYp40lA/8mu
	Kzjl/flypsNc3O+Je+u0tDewWTc+8aXaoCA==
X-Received: by 2002:a05:6830:3d18:b0:6b9:9cc0:537f with SMTP id eu24-20020a0568303d1800b006b99cc0537fmr2449340otb.33.1697555975555;
        Tue, 17 Oct 2023 08:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHygDzbf4FkOeZ5yzPHHp7dRoGWcri/Y9cHl/OSOwJOx3WBZoAenk49HB/I4yIkDgS7/InpTA==
X-Received: by 2002:a05:6830:3d18:b0:6b9:9cc0:537f with SMTP id eu24-20020a0568303d1800b006b99cc0537fmr2449321otb.33.1697555975333;
        Tue, 17 Oct 2023 08:19:35 -0700 (PDT)
Date: Tue, 17 Oct 2023 17:19:31 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtualization@lists.linux-foundation.org
Cc: virtio-comment@lists.oasis-open.org, anton.yakovlev@opensynergy.com,
	stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com,
	sgarzare@redhat.com, manos.pitsidianakis@linaro.org
Message-ID: <ZS6mA6/EsmvDVlTC@fedora>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] virtio-sound: release control request clarification

Hello,

This email is to clarify the VirtIO specification regarding the RELEASE
control request. Section 5.14.6.6.5.1 [1] states the following device
requirements for the RELEASE control request: 
1. The device MUST complete all pending I/O messages for the specified
stream ID.
2. The device MUST NOT complete the control request while there are
pending I/O messages for the specified stream ID.

The 1) requirement does not indicate what "complete" means. Does it mean
that the pending I/O messages in the tx queue shall be outputted in the
host, i.e., consumed by the audio backend? Or, completion means simply
to put the requests in the used-ring without consuming them?

Regarding 2), I interpret it as "the device shall wait until all I/O
messages are proceeded to complete the RELEASE control request".

Currently, the kernel driver seems not expecting such a delay when the
RELEASE command is sent. If I understand correctly, the kernel driver
first sends the RELEASE command and waits a fixed amount of time until
the device can process it. Then, the driver waits a fixed amount of time
until all pending IO messages are completed. If the device follows the
specification and waits until all messages IO are completed to issue the
completion of the RELEASE command, the kernel driver may timeout. The
time to complete N IO messages in the TX queue could be proportional
with the number of pending messages.

In our device implementation [2], RELEASE is handled as follows:
- Drop all messages in the TX queue without outputting in the host.
- Complete the RELEASE control request.

This seems to be working, however, I can observe that sometimes there
are still requests in the TX queue when we get RELEASE. Those requests
are never reproduced in the host.

My questions are:
- In the specification, should we modify it to clarify that all pending
  IO messages in the device are discarded during RELEASE, that is, not
  output to the host, but signaled to the guest as completed?
- According to the specification, should the driver wait in RELEASE an
  amount of time proportional to the number of periods yet to be
  reproduced?

Thanks, Matias.

[1]
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html
[2]
https://github.com/rust-vmm/vhost-device/tree/main/staging/vhost-device-sound


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

