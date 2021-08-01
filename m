Return-Path: <virtio-comment-return-2108-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B61BA98404C
	for <virtio-comment@lists.oasis-open.org>; Sun,  1 Aug 2021 10:46:13 +0000 (UTC)
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <YP/ffFbeJpDJ3sTG@stefanha-x1.localdomain> <87im0v4yrj.fsf@redhat.com>
 <3657bbc8-3299-97a5-b45a-04030da35c51@nvidia.com>
 <YQEa1b2QfW05e0iZ@stefanha-x1.localdomain>
 <8c0b3927-0c10-e688-33f4-f9fa99f57f02@nvidia.com>
 <YQFev1vXVFLlvW0w@stefanha-x1.localdomain>
 <eedd595d-77b9-2921-bbcc-ced2618bccc9@nvidia.com>
 <YQJrewVjjoSQeHWm@stefanha-x1.localdomain>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <ba991097-3028-6608-779f-a4e405bf9410@nvidia.com>
Date: Sun, 1 Aug 2021 13:46:03 +0300
MIME-Version: 1.0
In-Reply-To: <YQJrewVjjoSQeHWm@stefanha-x1.localdomain>
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 7/29/2021 11:48 AM, Stefan Hajnoczi wrote:
> On Wed, Jul 28, 2021 at 05:20:29PM +0300, Max Gurtovoy wrote:
>> On 7/28/2021 4:42 PM, Stefan Hajnoczi wrote:
>>> On Wed, Jul 28, 2021 at 01:59:26PM +0300, Max Gurtovoy wrote:
>>>> On 7/28/2021 11:52 AM, Stefan Hajnoczi wrote:
>>>>> On Tue, Jul 27, 2021 at 06:29:49PM +0300, Max Gurtovoy wrote:
>>>>>> On 7/27/2021 5:28 PM, Cornelia Huck wrote:
>>>>>>> On Tue, Jul 27 2021, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>>>>>>> On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
>>>>>>> How many different (groups of) commands can we reasonably expect? Do we
>>>>>>> need a generic discovery command, or can we get away with a feature bit
>>>>>>> covering each new group of commands?
>>>>>> I can't predict the future but IMO we need a discovery command.
>>>>>>
>>>>>> We have many devices and more can be added in the future.
>>>>> A <u8 class, u8 command> space is 65536 bits or 8KB. I think admin
>>>>> commands would not be included in VIRTIO Feature Bits but instead
>>>>> reported via a separate admin command that returns up to 8KB of data:
>>>>>
>>>>>      struct virtio_admin_report_cmds {
>>>>>          /* Bitmap of available admin commands [Device->Driver]
>>>>>           * bool command_present =
>>>>>           *        command_bits[class * 32 + command / 8] & (command % 8);
>>>>>           */
>>>>>          u8 command_bits[8192];
>>>>>      };
>>>> Yes, I divided it to multiple commands per class to cover the case we will
>>>> need more than 1 bit to describe a command.
>>>>
>>>> But I guess we can add it later on.
>>>>
>>>> I think the above should be:
>>>>
>>>> bool command_present = command_bits[class * 32 + command / 8] & (1 << (command % 8));
>>>>
>>>> isn't it ?
>>> You're right. I forgot to shift the bit :D.
>>>
>>>> Also what do you think about renaming <class, command> to <opcode, opmod> ?
>>> I need to understand how opcode and opmod values are used. I'm not sure.
>> Same as class and command just with different naming.
> Is opcode the same as command? What does opmod do?

no. opcode == class and opmod == command.


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

