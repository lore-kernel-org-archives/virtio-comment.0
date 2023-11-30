Return-Path: <virtio-comment-return-8696-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB973C4167B
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 10:46:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 19B6271C90
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 10:46:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D2A30986697
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 10:46:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B46CC986670; Thu, 30 Nov 2023 10:46:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A4467986671
	for <virtio-comment@lists.oasis-open.org>; Thu, 30 Nov 2023 10:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: gvtqKpkoOq2zpSymUOS8eg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701341202; x=1701946002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ov5KZVnh8vMo08NsqTBVIisW3PCNzgNNB0jGD0f7CFs=;
        b=UElZUsf8Q598HYo1Y0elquk3ZgzD3gJAUB4QAagE6yy4Mead0X5BbaglUzNgrijpTg
         6k5Ys/iuAhbqWa6CmixSwgdvShVprZDkvKzEbyVw7jHEBtNLwg+llQKWnzqla1XLS0vj
         YbSvXxN2ZlSTUW51Olww/KerifdlBeqlT1qseSVjqQAobs8+1tGIsmRf7Cwh2bvera61
         7l9vyy6sSpB+immnE7PsHDk7BMd7oyEd2jqXHSUmfOk5LsbtZtw3NKGxSV4HxA3IT0td
         iIy95jiJLMpKTqWDVVxfaEwolnf9LLaqALaLyjW4PnlXWYQLhA7/PlvIx4BlDUAh5oiU
         Q+1w==
X-Gm-Message-State: AOJu0YxZE3ZQp+uw+SWnjE/9T+n2z9AuLoGzrx38C7VKXk2SHYeOqljC
	kcJcpMz+03t65lU/Co7tYSwOiBJcyn3+kTypoYUHHy/jF3wZiftp9+Y7xPV2sVGsNZrku021pHZ
	3qlyurTmQ1fQ3v+uoUzQIZvfelWN1nllCSeDc4DZQ2A==
X-Received: by 2002:a0c:c487:0:b0:67a:542a:d91d with SMTP id u7-20020a0cc487000000b0067a542ad91dmr10466706qvi.2.1701341202616;
        Thu, 30 Nov 2023 02:46:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE11Q0fODCRISTQAxnRJ9yy/A4TZVHhM8uwQwICiFVaM8u1fyCyDsUvCMdtuPq0H3X+E0Gkgg==
X-Received: by 2002:a0c:c487:0:b0:67a:542a:d91d with SMTP id u7-20020a0cc487000000b0067a542ad91dmr10466694qvi.2.1701341202309;
        Thu, 30 Nov 2023 02:46:42 -0800 (PST)
Date: Thu, 30 Nov 2023 11:46:39 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Cc: virtio-comment@lists.oasis-open.org
Message-ID: <ZWhoD/1ARedxgQsT@fedora>
References: <ZR6EzpQb6J1TxbM8@fedora>
 <CAHYGQ0yw+ejG9TY57gVZeG3ucDxofebW5FDwhwLDS1HM6VfzaQ@mail.gmail.com>
 <ab659c42-3223-455d-8e22-fad373fa54e5@opensynergy.com>
MIME-Version: 1.0
In-Reply-To: <ab659c42-3223-455d-8e22-fad373fa54e5@opensynergy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH] virtio-sound: add latency_bytes definition

Hello Anton,

On Thu, Nov 30, 2023 at 10:30:35AM +0900, Anton Yakovlev wrote:
> Hi Matias,
> 
> 
> On 07.11.2023 19:46, Matias Ezequiel Vara Larsen wrote:
> > Ping Anton.
> > 
> > Thanks, Matias.
> > 
> > On Thu, Oct 5, 2023 at 11:41 AM Matias Ezequiel Vara Larsen
> > <mvaralar@redhat.com> wrote:
> > > 
> > > This commit aims at providing a better definition of latency_bytes. To
> > > do so, this commit defines latency_bytes as is defined in Crosvm.
> > > 
> > > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > ---
> > >   device-types/sound/description.tex | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
> > > index 54c9c8e..1349765 100644
> > > --- a/device-types/sound/description.tex
> > > +++ b/device-types/sound/description.tex
> > > @@ -694,7 +694,10 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
> > >   \begin{description}
> > >   \item[\field{status}] contains VIRTIO_SND_S_OK if an operation is successful,
> > >   and VIRTIO_SND_S_IO_ERR otherwise.
> > > -\item[\field{latency_bytes}] indicates the current device latency.
> > > +\item[\field{latency_bytes}] indicates the current device latency. For
> > > +playback, this is the amount of bytes that must be consumed before
> > > +the current request can be played. For capture, this is the latency in terms of
> > > +bytes that the capture buffer was recorded.
> > >   \end{description}
> 
> Yes, this field definitely needs some clarification.
> 
> If you think about it, from the point of view of the application in the guest,
> the size of the current latency is the current contents of the buffer. I.e.
> exactly what you added to the description, but without taking into account the
> value of this field.
> 
> In the current Linux driver implementation, this "latency_bytes" value is
> saved to the "delay" field, which is then passed to user space. And this
> "delay", as I understand it, indicates an additional delay caused by the
> specifics of the hardware.

Yes, I understood the same. For me, it was not clear how "delay" would
be used by user applications. In crosvm, for example, `latency_bytes` is
set to 0, but I'm not sure what would happen if it was set to something
else. When I played around with different values, I didn't notice any
difference in behavior.

> And it turns out that the latency_bytes field either should indicate such an
> additional delay (for example, caused by the specific implementation of the
> backend on the device side), or does not make sense, since the current latency
> value is already known a priori. What do you think?

Do you mean that we could get rid of this field and add it in the future
in case we need it? Or, to add to the description the fact that
latency_bytes is a specific implementation value that adds additional
delay?

Also I do not understand how the `latency_bytes` value and the
completion notification may interact. For example, a device could send
completion notification immediately after a request is received and just
set the correct value to the `latency_bytes` field to indicate how many
bytes would take to the current buffer to be consumed. I can't see any
issue with using the `latency_byte` value in that way.

Thanks, Matias.


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

