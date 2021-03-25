Return-Path: virtio-comment-return-1794-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7707A9865CD
	for <virtio-comment@lists.oasis-open.org>; Thu, 25 Mar 2021 02:42:50 +0000 (UTC)
References: <20210322034717.35135-1-jasowang@redhat.com>
 <20210322034717.35135-2-jasowang@redhat.com>
 <YFnCpdO4F9zkTjd9@stefanha-x1.localdomain>
 <be5b2622-f676-ddf0-2261-837e348c8a96@redhat.com>
 <YFsIrC6KigOjFxli@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2274873f-68a3-0d4b-8bd4-0fca77dffcb1@redhat.com>
Date: Thu, 25 Mar 2021 10:42:38 +0800
MIME-Version: 1.0
In-Reply-To: <YFsIrC6KigOjFxli@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] [PATCH V2 1/2] virtio: introduce virtqueue state
 as basic facility
Content-Type: multipart/alternative;
 boundary="------------F28638FEDFDFFDD195E55A1E"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--------------F28638FEDFDFFDD195E55A1E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable


=E5=9C=A8 2021/3/24 =E4=B8=8B=E5=8D=885:38, Stefan Hajnoczi =E5=86=99=E9=81=
=93:
> On Wed, Mar 24, 2021 at 04:15:55PM +0800, Jason Wang wrote:
>> =E5=9C=A8 2021/3/23 =E4=B8=8B=E5=8D=886:27, Stefan Hajnoczi =E5=86=99=E9=
=81=93:
>>> On Mon, Mar 22, 2021 at 11:47:16AM +0800, Jason Wang wrote:
>>>> +The \field{used_wrap_counter} field is the wrap counter that is used
>>>> +by the device.
>>>> +
>>>> +The used state is unnecessary when VIRTIO_RING_F_PACKED is not
>>>> +negotiated.
>>>> +
>>>> +See also \ref{sec:Packed Virtqueues / Driver and Device Ring Wrap Cou=
nters}.
>>>> +
>>>> +\drivernormative{\subsection}{Virtqueue State}{Basic Facilities of a =
Virtio Device / Virtqueue State}
>>>> +
>>>> +If VIRTIO_F_QUEUE_STATE has been negotiated, a driver MUST set the
>>>> +state of each virtqueue after setting the FEATURE_OK status bit but
>>>> +before setting the DRIVER_OK status bit.
>>>> +
>>>> +If VIRTIO_F_QUEUE_STATE has been negotiated. a driver MUST reset the
>>> s/negotiated./negotiated,/
>>>
>>>> +device before getting the virtqueue state.
>>> Interesting approach, but it makes sense that the device must be stoppe=
d
>>> before we mess with the queue state :).
>>>
>>> I wonder whether requiring the device to keep state across reset will
>>> cause issues in the future or for testing/fuzzing.
>>>
>>> Another approach would have been to add a new status register bit for
>>> pausing the device. That reminds me of vhost.
>>
>> That's the way I did here:
>> https://lists.oasis-open.org/archives/virtio-comment/202012/msg00027.htm=
l
> That design seems less risky. I think modifying the semantics of device
> reset might end up being a problem. Defining an explicit paused state
> for saving/loading state seems cleaner.
>
> Why did you end up switching approaches?


I try to seek some short-cut withut introducing new status bit but I end=20
up realizing it might not work as expected.

Another reason is that, by using new status bit, we need to ability to=20
resume the device by clearing the bit which is somehow conflict with=20
what spec requries:

"

2.1.1 Driver Requirements: Device Status Field

The driver MUST NOT clear adevice statusbit.

"

Maybe we can have an exception for the device stop/pause in this case.

Thanks


>
> Stefan

--------------F28638FEDFDFFDD195E55A1E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">=E5=9C=A8 2021/3/24 =E4=B8=8B=E5=8D=885:=
38, Stefan Hajnoczi =E5=86=99=E9=81=93:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:YFsIrC6KigOjFxli@stefanha-x1.localdomain">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, Mar 24, 2021 at 04:15:=
55PM +0800, Jason Wang wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">=E5=9C=A8 2021/3/23 =E4=B8=
=8B=E5=8D=886:27, Stefan Hajnoczi =E5=86=99=E9=81=93:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, Mar 22, 2021 at 11=
:47:16AM +0800, Jason Wang wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">+The \field{used_wrap_co=
unter} field is the wrap counter that is used
+by the device.
+
+The used state is unnecessary when VIRTIO_RING_F_PACKED is not
+negotiated.
+
+See also \ref{sec:Packed Virtqueues / Driver and Device Ring Wrap Counters=
}.
+
+\drivernormative{\subsection}{Virtqueue State}{Basic Facilities of a Virti=
o Device / Virtqueue State}
+
+If VIRTIO_F_QUEUE_STATE has been negotiated, a driver MUST set the
+state of each virtqueue after setting the FEATURE_OK status bit but
+before setting the DRIVER_OK status bit.
+
+If VIRTIO_F_QUEUE_STATE has been negotiated. a driver MUST reset the
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">s/negotiated./negotiated,/

</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">+device before getting t=
he virtqueue state.
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">Interesting approach, but =
it makes sense that the device must be stopped
before we mess with the queue state :).

I wonder whether requiring the device to keep state across reset will
cause issues in the future or for testing/fuzzing.

Another approach would have been to add a new status register bit for
pausing the device. That reminds me of vhost.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">

That's the way I did here:
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.oasis-open.org/arc=
hives/virtio-comment/202012/msg00027.html">https://lists.oasis-open.org/arc=
hives/virtio-comment/202012/msg00027.html</a>
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
That design seems less risky. I think modifying the semantics of device
reset might end up being a problem. Defining an explicit paused state
for saving/loading state seems cleaner.

Why did you end up switching approaches?</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I try to seek some short-cut withut introducing new status bit
      but I end up realizing it might not work as expected. <br>
    </p>
    <p>Another reason is that, by using new status bit, we need to
      ability to resume the device by clearing the bit which is somehow
      conflict with what spec requries:</p>
    <p>"</p>
    <p>2.1.1 Driver Requirements: Device Status Field<br>
    </p>
    <p><span style=3D"color: rgb(0, 0, 0); font-family: Arial, Helvetica,
        sans-serif; font-size: 13.3333px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">The driver
        MUST NOT clear a<span>=C2=A0</span></span><span class=3D"aeti-10"
        style=3D"font-style: italic; color: rgb(0, 0, 0); font-family:
        Arial, Helvetica, sans-serif; font-size: 13.3333px;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial;">device status<span>=C2=A0</span></span><span style=3D"col=
or:
        rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif;
        font-size: 13.3333px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">bit.</span></p>
    <p>"<br>
    </p>
    <p>Maybe we can have an exception for the device stop/pause in this
      case.</p>
    <p>Thanks<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:YFsIrC6KigOjFxli@stefanha-x1.localdomain">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Stefan
</pre>
    </blockquote>
  </body>
</html>

--------------F28638FEDFDFFDD195E55A1E--

