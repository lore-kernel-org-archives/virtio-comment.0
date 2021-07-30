Return-Path: <virtio-comment-return-2097-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C1AC298647B
	for <virtio-comment@lists.oasis-open.org>; Fri, 30 Jul 2021 07:06:14 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
Date: Fri, 30 Jul 2021 09:05:59 +0200
Message-ID: <87zgu41dt4.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Content-Type: text/plain
To: Max Gurtovoy <mgurtovoy@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jul 29 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:

> On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
>> On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
>>> +\subsubsection{Vendor specific command set}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Vendor specific command set}
>>> +
>>> +The Vendor specific command set is a group of classes and commands
>>> +within each of these classes which are vendor specific. Refer to
>>> +each vendor specification for more information on the supported
>>> +commands.
>> Here's another example.
>> It's important that there is a way to make a device completely
>> generic without vendor specific expensions.
>> Would be hard to do here.
>>
>> That's a generic comment.
>>
>> but specifically I am very reluctant to add vendor specific stuff like
>> this directly in the spec. We already have VIRTIO_PCI_CAP_VENDOR_CFG
>> and if that is not sufficient I would like to know why
>> before we add more vendor specific stuff.
>
> We are adding an option to add vendor specific commands. We're not 
> adding it to the spec since each vendor will have its own manual for
> that.

IMHO, that way madness lies. I want to be able to look at the spec and
be able to implement a compliant device or a compliant driver. If a
vendor has some special feature they want to support, put it in the
spec, so that it is possible to actually implement it.

>
> For example, we can use virtio-cli to pass command from command line to 
> device in pass-through manner without changing driver.

Things like that are part of the driver as in the spec sense. The spec
does not care how you actually split the implementation, or what
controls you are giving to whom. We need a defined interface.


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

