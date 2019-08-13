Return-Path: virtio-comment-return-840-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 26EF5985E56
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Aug 2019 15:21:44 +0000 (UTC)
References: <20190813091618.4433-1-ybettan@redhat.com>
 <20190813091618.4433-2-ybettan@redhat.com>
 <20190813070450-mutt-send-email-mst@kernel.org>
 <CAJSP0QU8yR+TekJLyqrTS-ukSjGMJ0zmi7W3yT_tYGOO5opknA@mail.gmail.com>
From: Yoni Bettan <ybettan@redhat.com>
Message-ID: <3222daf4-7f1a-ff19-a572-1d1b82be6499@redhat.com>
Date: Tue, 13 Aug 2019 18:21:38 +0300
MIME-Version: 1.0
In-Reply-To: <CAJSP0QU8yR+TekJLyqrTS-ukSjGMJ0zmi7W3yT_tYGOO5opknA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: [virtio-comment] Re: [PATCH V3 1/2] Changed fonts to fonts available with tex-live.
To: Stefan Hajnoczi <stefanha@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Eduardo Habkost <ehabkost@redhat.com>, Amnon Ilan <ailan@redhat.com>, chet.ensign@oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/13/19 3:43 PM, Stefan Hajnoczi wrote:
> On Tue, Aug 13, 2019 at 12:11 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>> Chet, please see below.
>>
>> Documents from
>> http://docs.oasis-open.org/templates/OASISSpecificationTemplateGuidelinesV4.0.html
>> all use microsoft fonts such as Arial.
>>
>> E.g. this can be seen in the PDFs on that site.
>>
>> How important is the use of the specific fonts for consistency?
> If the fonts cannot be changed in the official release of the spec,
> can we automatically detect their availability at build time so
> Liberation Sans fonts are used on machines without Microsoft fonts
> installed?  This way local builds use free fonts and the official
> releases continue to use the Microsoft fonts.


I think this is possible, this will required to change makeall.sh to 
determine if the machine runs Linux or other OS and according to it 
updates the fonts locally for Linux machines.


I will try it and send another version for this patch.

>
> Stefan

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

