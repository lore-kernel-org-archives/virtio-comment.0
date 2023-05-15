Return-Path: <virtio-comment-return-5904-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAB5C77B7D
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 15:17:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2FE0BF3F46
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 15:17:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 15B8B98650E
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 15:17:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 08DA89864EE; Mon, 15 May 2023 15:17:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC005986509
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 May 2023 15:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: LpLgOhi4Pe-jRPIgxr7udA-1
From: Cornelia Huck <cohuck@redhat.com>
To: "T.J. Alumbaugh" <talumbau@google.com>, virtio-comment@lists.oasis-open.org
In-Reply-To: <CABmGT5FVRj9=vrekhCOWwQnO2eOHDt8pA35hef+=BLN7fWi5=Q@mail.gmail.com>
Organization: Red Hat GmbH
References: <CABmGT5FVRj9=vrekhCOWwQnO2eOHDt8pA35hef+=BLN7fWi5=Q@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 15 May 2023 17:16:56 +0200
Message-ID: <877ct939qv.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: Re: [virtio-comment] trouble sending patch with git send-email

On Mon, May 15 2023, "T.J. Alumbaugh" <talumbau@google.com> wrote:

> Hi,
>
> I'm having an issue trying to send a proposed spec change for
> discussion to this list. I'm following the instructions here:
>
> https://github.com/oasis-tcs/virtio-spec#providing-feedback
>
> which seem to be pretty standard and the typical workflow for sending
> git patches. However, my messages bounce with this error:
>
> <virtio-comment@lists.oasis-open.org>: permission denied. Command output:
>     Traceback (most recent call last):   File
>     "/home/oasis/bin/kmlm_crosspost_issubn", line 14, in <module>     import
>     MySQLdb ImportError: No module named MySQLdb Sorry, only subscribers may
>     post. If you are a subscriber, please forward this message to
>     virtio-comment-owner@lists.oasis-open.org to get your new address included
>     (#5.7.2) ERROR: postqmail-local Error #77
>
>
> I have confirmed that I am a subscriber to this list. This email
> itself will serve as an experiment to determine if the message is
> legitimate (the system believes I am not a subscriber), or if this
> error is spurious and there is some other issue with sending a patch
> with `git send-email`. In the event that this email does get through,
> any advice on how to proceed would be much appreciated! Thanks,
>
> -T.J.

Just to make sure it's not something obvious: Have you double checked
that the author in git matches the address you subscribed with? Because
this mail came through, and having the author set to a different address
without realizing it is something that happens a lot.


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

