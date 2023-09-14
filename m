Return-Path: <virtio-comment-return-7419-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFEFEDE9A4
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:14:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 138113309E
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:14:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F10A6986641
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:14:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D998F98402B; Thu, 14 Sep 2023 11:14:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CB57498663D
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Sep 2023 11:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: wUE8MJaFNUCCZ1oEy6IoaA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694690055; x=1695294855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nc1eUKQLa9Cze03rndv7eWZSRr3HGJWwe1nNn2bcdgA=;
        b=TVStFdF95tWO5oTM4OZBJ7ThbAbbhgnBW06Oj0QxfXe9sflydNHJY1iRbwrvbeUCwK
         9XKxaAp3TQBEGEgaYFL4BMQc0gNhLkhHlZwlZVxN+lQoLeJ2Z+9NOrgHK6qCfhbfwEeR
         CMvWI45W514QdOqSiRMsYgDWLgAzQGW+rn2jSsjlU5UaTI+8F1znz8uYwfFI2lXXQd4M
         AVR3FOQOzPJZb1FGNvzKpVmC/w/uwinFjwKuLog0KJhLQX5+6rNzP6/QSz+maUa2Lc7m
         0Y4DIeNBej+U46tGlUH5lzBWl4BWSZChMWo3sb0RMdUzWayxtUTnSO5PmBx0r8xbH8yp
         +H2Q==
X-Gm-Message-State: AOJu0Yzj9ruDP5ZTlVdxp7SG3kXM+nrSUIPssKX/GXfLiikgHpKOabLk
	UN/wePzjnbPfH7Ny1ooIDr5G8lDgMmnf/w3RNc2G4SkoYQXdAXzfAk7ID95UQsRsbKliFTv9wfO
	E1kV34n4qNXaubLlrrA80UqmoIJMuk3xKqg==
X-Received: by 2002:a50:ee06:0:b0:523:c36e:ec8b with SMTP id g6-20020a50ee06000000b00523c36eec8bmr2042396eds.9.1694690055701;
        Thu, 14 Sep 2023 04:14:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT5HaO5uZaQLhoD3VH8SZhwphYjnm9jRe0MMeuEByX8uCJvzumlDP4A8Pm73YzMo2qOxtNWw==
X-Received: by 2002:a50:ee06:0:b0:523:c36e:ec8b with SMTP id g6-20020a50ee06000000b00523c36eec8bmr2042372eds.9.1694690055342;
        Thu, 14 Sep 2023 04:14:15 -0700 (PDT)
Date: Thu, 14 Sep 2023 07:14:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org
Message-ID: <20230914070911-mutt-send-email-mst@kernel.org>
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20230906081637.32185-1-lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 0/5] virtio: introduce SUSPEND bit and vq state

On Wed, Sep 06, 2023 at 04:16:32PM +0800, Zhu Lingshan wrote:
> This series introduces
> 1)a new SUSPEND bit in the device status
> Which is used to suspend the device, so that the device states
> and virtqueue states are stabilized.
> 
> 2)virtqueue state and its accessor, to get and set last_avail_idx
> and last_used_idx of virtqueues.
> 
> The main usecase of these new facilities is Live Migration.
> 
> Future work: dirty page tracking and in-flight descriptors.
> This series addresses many comments from Jason, Stefan and Eugenio
> from RFC series.

Compared to Parav's patchset this is much less functional.

Assuming that one goes in, can't we add ability to submit
admin commands through MMIO on the device itself and be done with it?

> Zhu Lingshan (5):
>   virtio: introduce vq state as basic facility
>   virtio: introduce SUSPEND bit in device status
>   virtqueue: constraints for virtqueue state
>   virtqueue: ignore resetting vqs when SUSPEND
>   virtio-pci: implement VIRTIO_F_QUEUE_STATE
> 
>  content.tex       | 118 ++++++++++++++++++++++++++++++++++++++++++++++
>  transport-pci.tex |  18 +++++++
>  2 files changed, 136 insertions(+)
> 
> -- 
> 2.35.3


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

