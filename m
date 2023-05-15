Return-Path: <virtio-comment-return-5909-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655D1C7EE22
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 15:46:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5E7EB60345
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 15:46:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B91B986512
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 15:46:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 365639864EE; Mon, 15 May 2023 15:46:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24DE5986509
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 May 2023 15:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3Fx8klJ3P6yBS1jrJnXlOg-1
From: Cornelia Huck <cohuck@redhat.com>
To: "T.J. Alumbaugh" <talumbau@google.com>
Cc: virtio-comment@lists.oasis-open.org
In-Reply-To: <CABmGT5EW_D7DWKM5WAGruyvyDiNv8R8_hGZXUvDc3itUZLeaQw@mail.gmail.com>
Organization: Red Hat GmbH
References: <CABmGT5FVRj9=vrekhCOWwQnO2eOHDt8pA35hef+=BLN7fWi5=Q@mail.gmail.com>
 <877ct939qv.fsf@redhat.com>
 <CABmGT5EW_D7DWKM5WAGruyvyDiNv8R8_hGZXUvDc3itUZLeaQw@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 15 May 2023 17:46:25 +0200
Message-ID: <87y1lp1tta.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] trouble sending patch with git send-email

On Mon, May 15 2023, "T.J. Alumbaugh" <talumbau@google.com> wrote:

> On Mon, May 15, 2023 at 9:17=E2=80=AFAM Cornelia Huck <cohuck@redhat.com>=
 wrote:
>>
>>
>> Just to make sure it's not something obvious: Have you double checked
>> that the author in git matches the address you subscribed with? Because
>> this mail came through, and having the author set to a different address
>> without realizing it is something that happens a lot.
>>
>
> Thanks for the suggestion. I confirmed that the Author for the git commit
> matches this email address:
>
> Author: T.J. Alumbaugh <talumbau@google.com>
>
> I also generated a cover letter for the patch, since it seems reasonable =
to
> include a significant "Motivation" section for a spec addition. That step
> is actually not in the guidance, but other than that, it's a pretty
> "vanilla" patch as far as I can tell. Is it undesirable to send cover
> letters for patches?

Presence of a cover letter or not should not make any difference whether
the mailing list accepts your post (I'd probably add a cover letter only
if the motivation section is too extensive for living in the git
repository in the end; if it should be included, there is nothing wrong
with a longer patch desription.)

Maybe you can try to cc: me on your submission? Then I can see where
things might have gone wrong. (Via the "--cc" option.)


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

