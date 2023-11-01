Return-Path: <virtio-comment-return-8085-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C792C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 06:50:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 66BF921690
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 06:50:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 32991986BBA
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 06:50:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 165A4986BAF; Wed,  1 Nov 2023 06:50:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 67DF1986BB0
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 06:50:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d06K6FyC2iR8kZTTpCvxZWJTzEB+VPC+8v5DgWRBKu1Zmdg+DWByP77i0uzi+lJjabHTUyIimrifdXodUXer5Yc11bUbtrW8YdvziVKZnfxnNwc1DYYMAMZ4H0xl55QXUxdZOoTJ9LB81oYBp4ESIhXJGgOzR+rJTxGlnpef2DNAdNAnwFw42MaGxBl7bdGY+IClzfhRoJHAeTl/6chRjQRDplUWfWaRYhY+weyfQBbUht05HMQRAkYN4BdbxZoEX7mlejxK7AUZcQFp3VCDWFdiIVDIWVjAkczLDwxfo0LfSMNB5Z8U7mJlmDG/p6PLrmVWtPXMs3FS7wZg0rIhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y045B7jCanQbQXjuH6G459h+bLedJgDB0oCgPfT2WMA=;
 b=nBEitbGdDPL9mNpVN12GmXfNvGpkP+6Eli7ZHAd0/X5GWB96KFWSJKQ1KJOk65U70Y6f57+5gm1SNtZn6pg2trXkYcvdX51oVV/KTu0Lyi57ldBe0Hq6Szzj1CfhlP68uEOGNPJC0USHjz/UbpLAoa15HfIu26TOrX1rv6Il9hFe2xQrtkouvjEumt+SlrZW6yTS/ew+r8Z0Uzy2F3sMB3kjfuZBuoWnyKTaOvSwKTsN6MbPR3ofxdH4WB2lno23CEvWwuFcwYaypJv1CRf4Pq1mihS+vJdRZEJroCdPHzIyg373F6LRdecxRjEZ+ZVYCUqt5bo1rlTtu+lKYJLkIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAADeVYIAEiiUAgAAAXICAAZfSAIAAAE8wgALlIwCAAAFh0IAGFdwAgAAAUgCAAGlTgIAAAOdQgAGLtoCAAAjegIABFlmAgAAs44CAAAKEcIAAD/uAgAAAm4CAAAJmQA==
Date: Wed, 1 Nov 2023 06:50:02 +0000
Message-ID:
 <PH0PR12MB5481DCAAFA84932C9D826C4ADCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
 <20231031054617-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54806512D1395AB39C59B821DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101012540-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54802C006C5ADE546783E610DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101023257-mutt-send-email-mst@kernel.org>
 <0bc21f96-486d-481f-8676-5144225e43bc@intel.com>
In-Reply-To: <0bc21f96-486d-481f-8676-5144225e43bc@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ2PR12MB8808:EE_
x-ms-office365-filtering-correlation-id: 9bc29904-213c-4322-50d5-08dbdaa6c5fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gGDjk5i+27xCusz4WYtDnLGWuNWGYSyneFfKJGGCiQYFMXiu3c/diiuQ5Joqf5+lGl0PuGXUbgJOL78bsAK11kO2cwCJSuxNvWDrEv9BpbJiOuxUrVMbCAx1H3oBK24G4Xm6XCFX6NtlXKYx6RyiwixIyErY7YS/C9ZoKMspRG7OQVPiUT8b6u7hWOs3ZvN5oAYrGqPlRzBmQlgQVUbsG0Do1C7fBXJCQ293lfjP8jWuabaLI4MPNUlpQFtCKoO29tLHlTA48hnHbrHUj2vo3a55VJl6UiweS8p8HDicpTsSuUKES53mm56avEN+iUb18ZN8WnwrrWkBAIOJwSGkpwarmN2PnElZCJVi+zX0TPLirRAqB7ysnxPx/tsbnYOsSR86ZV0KM2m3x0VBc+Ce2J3otP5/s1g94zKdM3QW+D9jEDMmHOf1mJmtJG+IcMFPFWcqUsfb/S/5o2p3TQSepCofsLf5xZV3yVSwjaA3WRJI5YBYgGNZcfhNXSmkmif8/exBrwVc8CX/dE6RgPZ0HG0P745Z4tPzd8o1upS7Lw/r3poF7kSF9q+YNMsA+V+Xr/4w7JzcCELxrZ90o77FNAjzfxmhED8CnAA4As1oP5ofHw6XwpSlMOG1+6dL7cPb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39860400002)(376002)(346002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(83380400001)(38070700009)(110136005)(38100700002)(122000001)(66446008)(52536014)(54906003)(8676002)(64756008)(53546011)(66476007)(316002)(66946007)(41300700001)(86362001)(5660300002)(71200400001)(6506007)(33656002)(7696005)(76116006)(55016003)(478600001)(2906002)(4326008)(66556008)(107886003)(26005)(9686003)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGxERXpaR0hhS2NMVlo2L1VMVmp4ZkdrbWFjWUlJM2I5RnhWUmt4ck94bGo2?=
 =?utf-8?B?U05jMTZKdnoxMWlUZ0NaaWRXSzRKNHo2VmEyNTR1dmM0Rk9KT3VjVU50Tm1O?=
 =?utf-8?B?NXVaZFJHQnkvOUlDdWtURnpwSzdwV3QwZDNMTUtKWU5mRnJYemtISEp1YVJt?=
 =?utf-8?B?YStvdG9TVEtqK2c5eVBoMzdwdkxObEJZcGVaVUFyOW8zM3BwZ2MxY2tnZ0Rs?=
 =?utf-8?B?MnV5aG02KzBLS0tVZ29yMUVid2dmL1duU25GQkxnN0c3SXdYanZDTmV4U3JD?=
 =?utf-8?B?eFZhTnIxM3VsK3Z5eHBiTlJGdVA3T3JxUnhxdW9VMW5PSjU3dnhhRmVZSlV4?=
 =?utf-8?B?UVZVMXV4MmFxNllsNmRmcitQS3YvWHIyOXpyT21LN0VhQ0FmK0tFSzcwaDFo?=
 =?utf-8?B?QjlCKzVUcGlkdjN1TkNacU5jNmdtWUZmcnZJenBKTkJxUW40UGc3eVZNMXd2?=
 =?utf-8?B?Q0FyUG9yR0lnNmxnN1dMQUwrenJGR2lvNUE4ekdEWkFDa2dxL3RPQWRyWUxK?=
 =?utf-8?B?L0N6VmxrYXJnRnVUcE1QV0VLeEhsd3Q3ZU9JdmU0S0ZGSURtcFk4bXZUQ3Rw?=
 =?utf-8?B?WXdBVzlsMVNjaWFwc2JjUkR5cGNmRTk1T3VicXQ1RTRjeWN6UExUbnZCUnJD?=
 =?utf-8?B?bjBpbVlQQWRNK2p3eGhaYllFbHQvQzB3Ui9GQ0V1MU0yVnUxakRBRHViL1hy?=
 =?utf-8?B?NXZncW4yOGFQMk43VnBVQ21CS0pSS3VHTHM4cUloRUpUSVFvZUg3djhkT1h4?=
 =?utf-8?B?K0dURy9tRjhlQ0UzbEpRR1N5Yy8yRlBldlErZWJGTGN1MHdibFN1SkcvQTZl?=
 =?utf-8?B?cHZWWEpBclFueFNyNk9sMEdxcE5nL0pydUp2UGsrT1lvYi8zNGtydTFUb0k5?=
 =?utf-8?B?cGh0UUY5d3dkYndUZnRDa0p3ZXRHQ01yNG03WFlmdS9mUFZobGpPOVNHangv?=
 =?utf-8?B?RzZvd3VxcHRmUFQyemhCTGZ4MHh0TVFPTlFXSFlPOGpuYnFVNDg3ODUxcitP?=
 =?utf-8?B?YmxVV2NNeGZCbWdEL2p2VUwzcURMWlNhL1E5M3lkeDBhYTMvQkRybkR0bDhx?=
 =?utf-8?B?anlPQVlqWUxDQnU0VEI0enI4SmhwenE2aGlOT1N1WGtSTGhjbWRaTWJRTWsv?=
 =?utf-8?B?Q3dpODJZdmp6ZTNxUzhMRHdlU2ExUGFUbkdYVzdJQ0hZakVITG90dUpvb0oz?=
 =?utf-8?B?RHY1TkFBaE9qaVBFZUJmVmxSSG9XVzJyR3A3TG8xa3BjdmhLeURENlk2cU5v?=
 =?utf-8?B?Y2RkNU5QZ1dRYTE3ZVBlb0ZvOFZGMGxOcHJUd2VLOUVja2pUbU5XRmRzR0Qr?=
 =?utf-8?B?RUZYekc3VGduTGM0TVk0bXV5YXk2d0hQOWlSamZ1cTcyb1UvTTNTYmhHZjhP?=
 =?utf-8?B?akFEdEQ0Nm5YcE50N3REdkNIYzBPN1prVkRWSGpXNTJtZWtNK0p2bGM2ZDZW?=
 =?utf-8?B?Y01mbEtMU0tmQmcvdlNnN2ZDdUdqNjRHZTZJQXpONGgwbytuaDJlbUFFU0FM?=
 =?utf-8?B?ZjBqL1NQRkZna1hQa25XVTNQWDVrZEZEZXpuRlVFK2xOY3pIb1YvbDhsdnhH?=
 =?utf-8?B?QmhQd1NVSytHMXg0Q2hEUkJLOFV4dnhTMXlCTDZrb0o5cTZmVnpqWCtRMjB5?=
 =?utf-8?B?SFRBTlNWRVhqd0VxRG9kZjk4MXVkRUhzUU83dDlLN2daNlZwRnpFUXlGdEpx?=
 =?utf-8?B?eXYzZElkeUh6UDlka3F6RkV2K2FVSFNxSWVKaElaTG9aRWk4RVkrNklaMVg1?=
 =?utf-8?B?MlpQOGFJcC9CSW12Nzg5RVB2QnhMeEc2eUNFK2ZrUzBPNFJrcHNDa3JRRjBk?=
 =?utf-8?B?Z1owN05DajZZZFF3MndkeTUxQlRvckRpVGpMREt0clNYUTlxRWw4eDJOeG81?=
 =?utf-8?B?ZS83aEJnTHBIUE84ajFoZUtneUNHRnFHSGk1a245Q3VoVmtSUldxYkJ0dHRi?=
 =?utf-8?B?cVJVdWwxd2szUVJwSUtSVjVGQkNsdHNFTTF4YWovRC9jelVncGVmQnhUdkVU?=
 =?utf-8?B?WTBVNWovZjNBWkNOTlhveXRNeWpVbnhhMFluUTJQL1hVeTZ6Wm54SWhJZkhC?=
 =?utf-8?B?Q0pSODVuYmZFQ3lRaVNOU0hodVROTGJYR1RUaDQrWTc5TTlDUURPa0RhVkFZ?=
 =?utf-8?Q?wGO0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc29904-213c-4322-50d5-08dbdaa6c5fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 06:50:02.3964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /+B9Wifyzmyg7em7hdCASAvxIB75+lVDUbqxNkU3cF4qQRb2niBOEKXY+s2A868VWUmgEGBdcZtPgyo68eqDGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8808
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQoNCj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBOb3ZlbWJlciAxLCAyMDIzIDEyOjA5IFBNDQo+IA0KPiBPbiAxMS8xLzIw
MjMgMjozNyBQTSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPiA+IE9uIFdlZCwgTm92IDAx
LCAyMDIzIGF0IDA1OjQyOjU2QU0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+IEZy
b206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+ID4+PiBTZW50OiBXZWRu
ZXNkYXksIE5vdmVtYmVyIDEsIDIwMjMgMTE6MDEgQU0NCj4gPj4+DQo+ID4+PiBPbiBXZWQsIE5v
diAwMSwgMjAyMyBhdCAwMjo1NDo0N0FNICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+
Pj4NCj4gPj4+Pj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4g
Pj4+Pj4gU2VudDogVHVlc2RheSwgT2N0b2JlciAzMSwgMjAyMyAzOjQ0IFBNDQo+ID4+Pj4+DQo+
ID4+Pj4+IE9uIFR1ZSwgT2N0IDMxLCAyMDIzIGF0IDA1OjQyOjI5UE0gKzA4MDAsIFpodSwgTGlu
Z3NoYW4gd3JvdGU6DQo+ID4+Pj4+Pj4gWW91ciBhbnN3ZXIgaXMgbm90IHJlbGV2YW50IHRvIHRo
aXMgZGlzY3Vzc2lvbiBhdCBhbGwuDQo+ID4+Pj4+Pj4gV2h5Pw0KPiA+Pj4+Pj4+IEJlY2F1c2Ug
d2Ugd2VyZSBkaXNjdXNzaW5nIHRoZSBzY2hlbWVzIHdoZXJlIHJlZ2lzdGVycyBhcmUgbm90IHVz
ZWQuDQo+ID4+Pj4+Pj4gT25lIGV4YW1wbGUgb2YgdGhhdCB3YXMgSU1TLiBJdCBkb2VzIG5vdCBt
YXR0ZXIgTVNJIG9yIE1TSVguDQo+ID4+Pj4+Pj4gQXMgZXhwbGFpbmVkIGluIEludGVsJ3MgY29t
bWl0IG1lc3NhZ2UsIHRoZSBrZXkgdG8gZm9jdXMgZm9yIElNUw0KPiA+Pj4+Pj4+IGlzICJxdWV1
ZQ0KPiA+Pj4+PiBtZW1vcnkiIG5vdCBzb21lIGh3IHJlZ2lzdGVyIGxpa2UgTVNJIG9yIE1TSS1Y
Lg0KPiA+Pj4+Pj4geW91IGtub3cgdGhlIGRldmljZSBhbHdheXMgbmVlZCB0byBrbm93IGEgYWRk
cmVzcyBhbmQgdGhlIGRhdGEgdG8NCj4gPj4+Pj4+IHNlbmQgYSBNU0ksIHJpZ2h0Pw0KPiA+Pj4+
PiBTbyBpZiB2aXJ0aW8gaXMgdG8gdXNlIElNUyB0aGVuIHdlJ2xsIG5lZWQgdG8gYWRkIGludGVy
ZmFjZXMgdG8NCj4gPj4+Pj4gcHJvZ3JhbSBJTVMsIEkgdGhpbmsuIEFzIHBhcnQgb2YgdGhhdCBw
YXRjaCAtIGl0J3MgcmVhc29uYWJsZSB0bw0KPiA+Pj4+PiBhc3N1bWUgLSB3ZSB3aWxsIGFsc28g
bmVlZCB0byBhZGQgYSB3YXkgdG8gcmV0cmlldmUgSU1TIHNvIGl0IGNhbg0KPiA+Pj4+PiBiZQ0K
PiA+Pj4gbWlncmF0ZWQuDQo+ID4+Pj4+IEhvd2V2ZXIsIHdoYXQgdGhpcyBleGFtcGxlIGRlbW9u
c3RyYXRlcyBpcyB0aGF0IHRoZSBhcHByb2FjaCB0YWtlbg0KPiA+Pj4+PiBieSB0aGlzIHByb3Bv
c2FsIHRvIG1pZ3JhdGUgY29udHJvbCBwYXRoIHN0cnVjdHVyZXMgLSBuYW1lbHksIGJ5DQo+ID4+
Pj4+IGRlZmluaW5nIGEgc3RydWN0dXJlIHVzZWQganVzdCBmb3IgbWlncmF0aW9uIC0gbWVhbnMg
dGhhdCB3ZSB3aWxsDQo+ID4+Pj4+IG5lZWQgdG8gY29tZSB1cCB3aXRoIGEgbWlncmF0aW9uIGlu
dGVyZmFjZSBlYWNoIHRpbWUuDQo+ID4+Pj4+IEFuZCB0aGF0IGlzIHVuZm9ydHVuYXRlLg0KPiA+
Pj4+Pg0KPiA+Pj4+IFdoZW4gdGhlIGRldmljZSBzdXBwb3J0cyBhIG5ldyBmZWF0dXJlIGl0IGhh
cyBzdXBwb3J0ZWQgbmV3DQo+IGZ1bmN0aW9uYWxpdHkuDQo+ID4+Pj4gSGVuY2UgdGhlIGxpdmUg
bWlncmF0aW9uIHNpZGUgYWxzbyBnb3QgdXBkYXRlZC4NCj4gPj4+PiBIb3dldmVyLCB0aGUgbGl2
ZSBtaWdyYXRpb24gZHJpdmVyIGRvZXMgbm90IGhhdmUgdG8gdW5kZXJzdGFuZCB3aGF0DQo+ID4+
Pj4gaXMgaW5zaWRlDQo+ID4+PiB0aGUgY29udHJvbCBwYXRoIHN0cnVjdHVyZXMuDQo+ID4+Pj4g
SXQgaXMganVzdCBieXRlIHN0cmVhbS4NCj4gPj4+PiBPbmx5IGlmIHRoZSBoeXBlcnZpc29yIGxp
dmUgbWlncmF0aW9uIGRyaXZlIGludm9sdmVkIGluIGVtdWxhdGluZywNCj4gPj4+PiBpdCB3aWxs
IHBhcnNlDQo+ID4+PiBhbmQgdGhhdCBpcyBmaW5lIGFzIGxpa2Ugb3RoZXIgY29udHJvbCBzdHJ1
Y3R1cmVzLg0KPiA+Pj4NCj4gPj4+IFRoZSBwb2ludCBpcyB0aGF0IGFueSBuZXcgZmllbGQgbmVl
ZHMgdG8gYmUgYWRkZWQgaW4gdHdvIHBsYWNlcyBub3cNCj4gPj4+IGFuZCB0aGF0IGlzIG5vdCBn
cmVhdCBhdCBhbGwuDQo+ID4+Pg0KPiA+PiBNb3N0IGNvbnRyb2wgc3RydWN0cyBhcmUgd2VsbCBk
ZWZpbmVkLiBTbyBvbmx5IGl0cyB0eXBlIGZpZWxkIGlzIGFkZGVkIHRvDQo+IG1pZ3JhdGluZyBk
cml2ZXIgc2lkZS4NCj4gPj4gVGhpcyBpcyB2ZXJ5IGxvdyBvdmVyaGVhZCBmaWVsZCBhbmQgaGFu
ZGxlZCBpbiBnZW5lcmljIHdheSBmb3IgYWxsIGRldmljZQ0KPiB0eXBlcyBhbmQgZm9yIGFsbCBj
b21tb24gdHlwZXMuDQo+ID4gV2VpcmQsIG5vdCB3aGF0IEkgc2VlLiAgRS5nLiB5b3Ugc2VlbSB0
byBoYXZlIGEgc3RydWN0dXJlIGR1cGxpY2F0aW5nDQo+ID4gcXVldWUgZmllbGRzLiBFYWNoIG5l
dyBmaWVsZCB3aWxsIGhhdmUgdG8gYmUgYWRkZWQgdGhlcmUgaW4gYWRkaXRpb24NCj4gPiB0byB0
aGUgdHJhbnNwb3J0Lg0KPiA+DQo+ID4+PiBXZSBuZWVkIGEgc3Ryb25nZXIgY29tcGF0aWJsaXR5
IHN0b3J5IGhlcmUgSSB0aGluay4NCj4gPj4+DQo+ID4+PiBPbmUgd2F5IHRvIHNob3cgaG93IGl0
J3MgZGVzaWduZWQgdG8gd29yayB3b3VsZCBiZSB0byBzcGxpdCB0aGUNCj4gPj4+IHBhdGNoZXMu
IEZvciBleGFtcGxlLCBhZGQgcXVldWUgbm90aWZ5IGRhdGEgYW5kIHF1ZXVlIHJlc2V0IHNlcGFy
YXRlbHkuDQo+ID4+IEkgZGlkbid0IGZvbGxvdyB0aGUgc3VnZ2VzdGlvbi4gQ2FuIHlvdSBleHBs
YWluIHNwbGl0dGluZyBwYXRjaGVzIGFuZCBpdHMNCj4gcmVsYXRpb24gdG8gdGhlIHN0cnVjdHVy
ZT8NCj4gPj4NCj4gPj4+IEFub3RoZXIgaXMgdG8gYWRkIE1TSVggdGFibGUgbWlncmF0aW9uIG9w
dGlvbiBmb3Igd2hlbiBNU0lYIHRhYmxlIGlzDQo+ID4+PiBwYXNzZWQgdGhyb3VnaCB0byBndWVz
dC4NCj4gPj4gWWVzLCB0aGlzIHdpbGwgYmUgYWRkZWQgaW4gZnV0dXJlIHdoZW4gdGhlcmUgaXMg
YWN0dWFsIGh5cGVydmlzb3IgZm9yIGl0Lg0KPiA+IFlvdSBhcmUgdHlpbmcgdGhlIGFyY2hpdGVj
dHVyZSB0byBhbiBleHRyZW1lbHkgaW1wbGVtZW50YXRpb24gc3BlY2lmaWMNCj4gPiBkZXRhaWwu
DQo+ID4NCj4gPiBIeXBlcnZpc29ycyAqYWxyZWFkeSogaGF2ZSBtaWdyYXRlIHRoZSBNU0lYIHRh
YmxlLiBKdXN0IGluIGENCj4gPiBoeXBlcnZpc29yIHNwZWNpZmljIHdheS4gcXVldWUgdmVjdG9y
IGlzIGFuIGluZGV4IGludG8gdGhpcyB0YWJsZS4gU28NCj4gPiB0aGUgaW5kZXggaXMgbWlncmF0
ZWQgdGhyb3VnaCB0aGUgZGV2aWNlIGJ1dCB0aGUgdGFibGUgaXRzZWxmIGhhcyB0bw0KPiA+IGJl
IHRyYXBwZWQgYW5kIGVtdWxhdGVkIGJ5IGh5cGVydmlzb3I/IEdpdmUgbWUgYSBicmVhay4NCj4g
SSBhZ3JlZSwgdGhlIE1TSSB0YWJsZSBjb3VsZCBiZSBSL1cgYW55d2F5Lg0KUGxlYXNlIGV4cGxh
aW4gdGhlIG1vdGl2YXRpb24sIHdoeSBpdCBjYW5ub3QgYmUgYWRkZWQgd2hlbiB0aGVyZSBpcyBf
cmVhbF8gc3cgd2hpY2ggd2lsbCB1c2UgaXQ/DQpJIGFza2VkIHRvIGFkZCBpdCB3aGVuIGl0IGlz
IG5lZWRlZC4NCldoeSBpdCBpcyBtdXN0IHJpZ2h0IG5vdywgaWYgaXQgaXMuDQpJZiB0aGVyZSBp
cyBhbnkgc29mdHdhcmUgbGlrZSB0byB1c2UgaXQsIHBsZWFzZSBleHBsYWluIHdoaWNoIGlzIGl0
IGFuZCBob3cgd2lsbCBpdCB1c2UgaXQuDQoNCg==

